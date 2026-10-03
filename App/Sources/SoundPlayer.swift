import AVFoundation
import MigrantCore

/// Щелчок кнопки и фон места: море, чайки, дождь. Синтез из `SoundSynth`.
///
/// Отдельный движок от музыки: фон меняется с каждой карточкой,
/// а музыка должна играть, не прерываясь.
final class SoundPlayer {
    static let shared = SoundPlayer()

    private let engine = AVAudioEngine()
    private let clickNode = AVAudioPlayerNode()
    private let ambienceNode = AVAudioPlayerNode()
    private let sampleRate = 22_050.0
    private var clickBuffer: AVAudioPCMBuffer?
    private var ambienceBuffers: [Ambience: AVAudioPCMBuffer] = [:]
    private var currentAmbience: Ambience?

    private init() {
        let format = AVAudioFormat(standardFormatWithSampleRate: sampleRate, channels: 1)
        for node in [clickNode, ambienceNode] {
            engine.attach(node)
            engine.connect(node, to: engine.mainMixerNode, format: format)
        }
        // Фон тише музыки: он должен угадываться, а не заглушать.
        ambienceNode.volume = 0.35
    }

    private var enabled: Bool { AppSettings.shared.value.soundsOn }

    func click() {
        guard enabled else { return }
        if clickBuffer == nil { clickBuffer = buffer(SoundSynth.render(.click, sampleRate: sampleRate)) }
        guard let clickBuffer, start() else { return }
        clickNode.scheduleBuffer(clickBuffer, at: nil, options: .interrupts)
        clickNode.play()
    }

    /// Фон для сцены. Тот же фон не перезапускается — море не «щёлкает» между карточками.
    func ambience(for scene: String?) {
        let wanted = enabled ? Ambience.of(scene: scene) : nil
        guard wanted != currentAmbience || (wanted != nil && !ambienceNode.isPlaying) else { return }
        ambienceNode.stop()
        currentAmbience = wanted
        guard let wanted else { return }
        if ambienceBuffers[wanted] == nil {
            ambienceBuffers[wanted] = buffer(SoundSynth.render(wanted, sampleRate: sampleRate))
        }
        guard let loop = ambienceBuffers[wanted], start() else { return }
        ambienceNode.scheduleBuffer(loop, at: nil, options: .loops)
        ambienceNode.play()
    }

    func stopAmbience() {
        ambienceNode.stop()
        currentAmbience = nil
    }

    private func start() -> Bool {
        if engine.isRunning { return true }
        try? AVAudioSession.sharedInstance().setActive(true)
        return (try? engine.start()) != nil
    }

    private func buffer(_ samples: [Float]) -> AVAudioPCMBuffer? {
        guard !samples.isEmpty,
              let format = AVAudioFormat(standardFormatWithSampleRate: sampleRate, channels: 1),
              let buffer = AVAudioPCMBuffer(pcmFormat: format, frameCapacity: AVAudioFrameCount(samples.count)),
              let channel = buffer.floatChannelData?[0]
        else { return nil }
        buffer.frameLength = AVAudioFrameCount(samples.count)
        samples.withUnsafeBufferPointer { source in
            if let base = source.baseAddress { channel.update(from: base, count: samples.count) }
        }
        return buffer
    }
}
