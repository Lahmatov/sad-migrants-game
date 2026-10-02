import AVFoundation
import MigrantCore

/// Фоновая музыка: синтез из `Chiptune` или настоящая запись, если она лежит
/// в `App/Resources/Music/<id>.m4a` (или `.mp3`).
///
/// Звук идёт в категории ambient: переключатель «без звука» на айфоне
/// выключает и игру, а музыка в наушниках у человека не прерывается.
final class MusicPlayer {
    static let shared = MusicPlayer()

    private let engine = AVAudioEngine()
    private let node = AVAudioPlayerNode()
    private var filePlayer: AVAudioPlayer?
    private var currentTrack: String?
    /// Отрисованные треки: синтез занимает доли секунды, но не на каждое переключение.
    private var buffers: [String: AVAudioPCMBuffer] = [:]
    private let sampleRate = 22_050.0

    private init() {
        try? AVAudioSession.sharedInstance().setCategory(.ambient, options: [.mixWithOthers])
        let format = AVAudioFormat(standardFormatWithSampleRate: sampleRate, channels: 1)
        engine.attach(node)
        engine.connect(node, to: engine.mainMixerNode, format: format)
    }

    /// Привести звук в соответствие с настройками: включить, выключить, сменить трек или громкость.
    func apply(_ settings: MigrantCore.Settings) {
        guard settings.musicOn, settings.musicVolume > 0 else {
            stop()
            return
        }
        let volume = Float(settings.musicVolume)
        if currentTrack != settings.track {
            stop()
            play(settings.track)
        }
        node.volume = volume
        filePlayer?.volume = volume
    }

    private func play(_ id: String) {
        currentTrack = id
        try? AVAudioSession.sharedInstance().setActive(true)
        if let url = recording(id), let player = try? AVAudioPlayer(contentsOf: url) {
            player.numberOfLoops = -1
            player.play()
            filePlayer = player
            return
        }
        guard let track = MusicTrack.track(id: id), let buffer = buffer(for: track) else { return }
        if !engine.isRunning { try? engine.start() }
        node.scheduleBuffer(buffer, at: nil, options: .loops)
        node.play()
    }

    private func stop() {
        node.stop()
        filePlayer?.stop()
        filePlayer = nil
        currentTrack = nil
    }

    private func recording(_ id: String) -> URL? {
        let folder = Bundle.main.resourceURL?.appending(path: "Music")
        for ext in ["m4a", "mp3"] {
            if let url = folder?.appending(path: "\(id).\(ext)"),
               FileManager.default.fileExists(atPath: url.path(percentEncoded: false)) {
                return url
            }
        }
        return nil
    }

    private func buffer(for track: MusicTrack) -> AVAudioPCMBuffer? {
        if let cached = buffers[track.id] { return cached }
        let samples = Chiptune.render(track, sampleRate: sampleRate)
        guard let format = AVAudioFormat(standardFormatWithSampleRate: sampleRate, channels: 1),
              let buffer = AVAudioPCMBuffer(pcmFormat: format, frameCapacity: AVAudioFrameCount(samples.count)),
              let channel = buffer.floatChannelData?[0]
        else { return nil }
        buffer.frameLength = AVAudioFrameCount(samples.count)
        samples.withUnsafeBufferPointer { source in
            if let base = source.baseAddress {
                channel.update(from: base, count: samples.count)
            }
        }
        buffers[track.id] = buffer
        return buffer
    }
}
