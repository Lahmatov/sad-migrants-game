import MigrantCore
import SwiftUI

/// Настройки: цвета, язык, музыка, приватность и пара слов об истории.
struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    private let settings = AppSettings.shared

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text(L(.settings))
                        .font(Theme.title)
                        .foregroundStyle(Theme.accent)
                        .minimumScaleFactor(0.5)
                    Spacer()
                    Button(L(.done)) { dismiss() }
                        .font(Theme.button)
                        .foregroundStyle(Theme.accent)
                }

                section(L(.theme)) {
                    choiceRow(ColorTheme.allCases, selected: settings.value.theme,
                              title: { L($0.titleKey) }) { settings.value.theme = $0 }
                }

                section(L(.language)) {
                    choiceRow(AppLanguage.allCases, selected: settings.value.language,
                              title: { $0.nativeName }) { settings.value.language = $0 }
                    if settings.value.language != .ru {
                        note(L(.languageNote))
                    }
                }

                section(L(.music)) {
                    Toggle(L(.musicOn), isOn: Binding(
                        get: { settings.value.musicOn },
                        set: { settings.value.musicOn = $0 }))
                        .font(Theme.body)
                        .foregroundStyle(Theme.text)
                        .tint(Theme.accent)
                    HStack {
                        Image(systemName: "speaker.fill")
                        Slider(value: Binding(
                            get: { settings.value.musicVolume },
                            set: { settings.value.musicVolume = $0 }), in: 0...1)
                            .tint(Theme.accent)
                            .accessibilityLabel(L(.volume))
                        Image(systemName: "speaker.wave.3.fill")
                    }
                    .foregroundStyle(Theme.dim)
                    .disabled(!settings.value.musicOn)
                    Text(L(.track))
                        .font(Theme.caption)
                        .foregroundStyle(Theme.dim)
                    ForEach(MusicTrack.all) { track in
                        trackButton(track)
                    }
                    Toggle(L(.sounds), isOn: Binding(
                        get: { settings.value.soundsOn },
                        set: { settings.value.soundsOn = $0 }))
                        .font(Theme.body)
                        .foregroundStyle(Theme.text)
                        .tint(Theme.accent)
                }

                section(L(.textFont)) {
                    choiceRow([true, false], selected: settings.value.pixelText,
                              title: { L($0 ? .fontPixel : .fontPlain) }) { settings.value.pixelText = $0 }
                }

                section(L(.privacy)) { note(L(.privacyText)) }
                section(L(.aboutStory)) { note(L(.aboutStoryText)) }
            }
            .padding(24)
        }
        .background(Theme.background.ignoresSafeArea())
        .onChange(of: settings.value) { _, new in MusicPlayer.shared.apply(new) }
    }

    private func section<Content: View>(_ title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title.uppercased())
                .font(Theme.caption)
                .foregroundStyle(Theme.accent)
            content()
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .pixelFrame()
    }

    private func note(_ text: String) -> some View {
        Text(text)
            .font(Theme.body)
            .foregroundStyle(Theme.text)
            .fixedSize(horizontal: false, vertical: true)
    }

    private func choiceRow<Item: Hashable>(_ items: [Item], selected: Item, title: @escaping (Item) -> String,
                                           select: @escaping (Item) -> Void) -> some View {
        HStack(spacing: 8) {
            ForEach(items, id: \.self) { item in
                Button { select(item) } label: {
                    Text(title(item))
                        .font(Theme.caption)
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                        .foregroundStyle(item == selected ? Theme.background : Theme.text)
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .pixelFrame(color: Theme.accent, fill: item == selected ? Theme.accent : Theme.panel)
                }
                .buttonStyle(.plain)
                .accessibilityAddTraits(item == selected ? .isSelected : [])
            }
        }
    }

    private func trackButton(_ track: MusicTrack) -> some View {
        let selected = settings.value.track == track.id
        return Button {
            settings.value.track = track.id
            settings.value.musicOn = true
        } label: {
            HStack {
                Image(systemName: selected ? "music.note" : "circle")
                Text(track.title(settings.value.language))
                Spacer()
            }
            .font(Theme.body)
            .foregroundStyle(selected ? Theme.accent : Theme.text)
            .padding(.vertical, 6)
        }
        .buttonStyle(.plain)
        .accessibilityAddTraits(selected ? .isSelected : [])
    }
}
