import SwiftUI

/// Палитра Endesga 32 — та же, в которой рисуются картинки по брифу.
/// Сцены и интерфейс из одной палитры не спорят друг с другом.
enum E32 {
    static func hex(_ value: UInt32) -> Color {
        Color(red: Double((value >> 16) & 0xFF) / 255,
              green: Double((value >> 8) & 0xFF) / 255,
              blue: Double(value & 0xFF) / 255)
    }

    static let night = hex(0x181425)
    static let navy = hex(0x262b44)
    static let slate = hex(0x3a4466)
    static let steel = hex(0x5a6988)
    static let mist = hex(0x8b9bb4)
    static let cloud = hex(0xc0cbdc)
    static let white = hex(0xffffff)
    static let deepSea = hex(0x193c3e)
    static let pine = hex(0x265c42)
    static let green = hex(0x3e8948)
    static let lime = hex(0x63c74d)
    static let ocean = hex(0x124e89)
    static let sky = hex(0x0099db)
    static let cyan = hex(0x2ce8f5)
    static let plum = hex(0x3e2731)
    static let brown = hex(0x733e39)
    static let clay = hex(0xb86f50)
    static let tan = hex(0xe4a672)
    static let sand = hex(0xead4aa)
    static let rust = hex(0xbe4a2f)
    static let orange = hex(0xd77643)
    static let tangerine = hex(0xf77622)
    static let gold = hex(0xfeae34)
    static let lemon = hex(0xfee761)
    static let red = hex(0xe43b44)
    static let purple = hex(0x68386c)
    static let magenta = hex(0xb55088)
    static let pink = hex(0xf6757a)
    static let peach = hex(0xe8b796)
    static let skin = hex(0xc28569)
}

/// Что нарисовать в сцене, пока нет настоящей картинки.
///
/// Рецепт собирается из двух частей: «где мы» (акт задаёт небо, свет,
/// погоду) и «что это за место» (имя сцены задаёт море, улицу, комнату).
struct SceneRecipe {
    enum Place {
        case sea(Shore)
        case city
        case interior
        case office
        case phone(PhoneKind)
        case plane
        case stadium
        case court
        case bricks
    }

    enum Shore { case pebbles, sand, rocks }
    enum PhoneKind { case notification, chat, video }

    var place: Place = .interior
    var sky: [Color] = [E32.navy, E32.slate, E32.steel]
    var sea: [Color] = [E32.ocean, E32.sky]
    var buildings: [Color] = [E32.night, E32.navy]
    var street: Color = E32.slate
    var wall: Color = E32.slate
    var floor: Color = E32.navy
    var windowLight: Color = E32.gold
    var sun: Color?
    var snow = false
    var rain = false
    var stars = false
    var seagulls = false
    var mountains = false
    var palms = false
    var neon = false
    var steam = false
    var fairyLights = false
    var breath = false
    var suitcase = false
    /// Что видно в окне комнаты.
    var windowSea = false

    static func make(scene: String?, act: String) -> SceneRecipe {
        var r = mood(act: act)
        let name = scene ?? ""

        switch name {
        case "batumi_beach":
            r.place = .sea(.pebbles); r.mountains = true
        case "batumi_rain":
            r.place = .sea(.pebbles); r.rain = true; r.sky = [E32.slate, E32.steel, E32.mist]
        case "batumi_boulevard":
            r.place = .sea(.pebbles); r.palms = true; r.neon = true
        case "figueira_beach":
            r.place = .sea(.sand); r.seagulls = true
        case "ocean":
            r.place = .sea(.rocks); r.sky = [E32.steel, E32.mist, E32.cloud]; r.sea = [E32.deepSea, E32.ocean]
        case "ocean_sunset", "oeiras_beach":
            r = mood(act: "oeiras"); r.place = .sea(.sand); r.seagulls = true
        case "yard_home", "exchange", "tbilisi_old_town", "batumi_street", "lisbon_street",
             "figueira_street", "oeiras_street", "batumi_kindergarten", "figueira_school",
             "oeiras_school", "playground":
            r.place = .city
            if name == "exchange" { r.neon = true; r.stars = true }
            if name == "batumi_street" { r.neon = true; r.rain = true }
            if name.hasSuffix("_school") || name == "batumi_kindergarten" { r.stars = false }
        case "plane":
            r.place = .plane
        case "car":
            // Дорога через перевал: горы и облака, без моря.
            r.place = .sea(.rocks); r.mountains = true; r.sea = [E32.pine, E32.green]
            r.sky = [E32.steel, E32.mist, E32.cloud]
        case "stadium":
            r.place = .stadium
        case "padel":
            r.place = .court
        case "legoland":
            r.place = .bricks
        case "phone":
            r.place = .phone(.notification)
        case "phone_chat":
            r.place = .phone(.chat)
        case "phone_video":
            r.place = .phone(.video)
        case "financas", "bank", "aima", "ctt_post", "clinic", "hospital", "lawyer",
             "public_service_hall", "border", "supermarket", "batumi_supermarket",
             "car_dealer", "airport_home", "transit", "university":
            r.place = .office
        default:
            r.place = .interior
            r.suitcase = name == "suitcase"
            r.steam = ["kitchen_mom", "batumi_cafe", "pastelaria"].contains(name)
            r.fairyLights = ["friends_kitchen", "batumi_bar", "figueira_flat_party"].contains(name)
            r.breath = name == "flat_cold"
            if name == "flat_cold" { r.wall = E32.steel; r.windowLight = E32.cloud }
            if name == "batumi_bar" { r.rain = true }
            if name == "lisbon_flat_keys" { r = mood(act: "oeiras"); r.windowSea = true }
        }
        return r
    }

    /// Свет и погода места. Петербург — сумерки и снег, Тбилиси — тёплый
    /// вечер, Батуми — серо-зелёное море, Португалия — солнце, Оэйраш — закат.
    static func mood(act: String) -> SceneRecipe {
        var r = SceneRecipe()
        switch act {
        case "tbilisi":
            r.sky = [E32.plum, E32.brown, E32.clay, E32.tan]
            r.buildings = [E32.plum, E32.brown]
            r.street = E32.brown
            r.wall = E32.clay; r.floor = E32.brown
            r.stars = true
        case "batumi":
            r.sky = [E32.slate, E32.steel, E32.mist]
            r.sea = [E32.deepSea, E32.pine]
            r.buildings = [E32.navy, E32.slate]
            r.street = E32.navy
            r.wall = E32.mist; r.floor = E32.steel
            r.windowSea = true
        case "figueira", "figueira2":
            r.sky = [E32.sky, E32.cyan, E32.cloud]
            r.sea = [E32.ocean, E32.sky]
            r.buildings = [E32.sand, E32.cloud]
            r.street = E32.tan
            r.wall = E32.sand; r.floor = E32.clay
            r.sun = E32.lemon
        case "oeiras":
            r.sky = [E32.purple, E32.magenta, E32.pink, E32.tangerine, E32.gold]
            r.sea = [E32.purple, E32.ocean]
            r.buildings = [E32.plum, E32.purple]
            r.street = E32.plum
            r.wall = E32.peach; r.floor = E32.brown
            r.sun = E32.lemon
        default:
            // Петербург: сборы и отъезд.
            r.sky = [E32.night, E32.navy, E32.slate, E32.steel]
            r.buildings = [E32.night, E32.navy]
            r.street = E32.slate
            r.wall = E32.slate; r.floor = E32.navy
            r.snow = true
        }
        return r
    }
}

/// Сцена, нарисованная кодом: 180×135 «пикселей», 8 кадров в секунду.
struct LiveScene: View {
    let scene: String?
    let act: String

    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        let recipe = SceneRecipe.make(scene: scene, act: act)
        TimelineView(.animation(minimumInterval: 1.0 / 8, paused: reduceMotion)) { timeline in
            Canvas { context, size in
                let frame = Int(timeline.date.timeIntervalSinceReferenceDate * 8)
                SceneRenderer(canvas: PixelCanvas(context: context, size: size),
                              recipe: recipe, frame: frame).draw()
            }
        }
        .accessibilityHidden(true)
    }
}

/// Рисование крупными «пикселями» в виртуальной сетке 180×135.
struct PixelCanvas {
    static let width = 180
    static let height = 135

    let context: GraphicsContext
    let scale: CGFloat
    let origin: CGPoint

    init(context: GraphicsContext, size: CGSize) {
        self.context = context
        let scale = max(size.width / CGFloat(Self.width), size.height / CGFloat(Self.height))
        self.scale = scale
        // Заполняем рамку целиком; лишнее по краям обрезается.
        self.origin = CGPoint(x: (size.width - CGFloat(Self.width) * scale) / 2,
                              y: (size.height - CGFloat(Self.height) * scale) / 2)
    }

    func rect(_ x: Int, _ y: Int, _ w: Int, _ h: Int, _ color: Color) {
        guard w > 0, h > 0 else { return }
        // +0.5 убирает щели между соседними «пикселями» при дробном масштабе.
        let frame = CGRect(x: origin.x + CGFloat(x) * scale, y: origin.y + CGFloat(y) * scale,
                           width: CGFloat(w) * scale + 0.5, height: CGFloat(h) * scale + 0.5)
        context.fill(Path(frame), with: .color(color))
    }

    func dot(_ x: Int, _ y: Int, _ color: Color) {
        rect(x, y, 1, 1, color)
    }
}

/// Псевдослучайное 0..<1 из координат: одинаковое в каждом кадре,
/// поэтому дома и камни не прыгают.
func pixelNoise(_ a: Int, _ b: Int, _ seed: Int = 0) -> Double {
    var h = UInt64(bitPattern: Int64(a &* 374_761_393 &+ b &* 668_265_263 &+ seed &* 2_147_483_647))
    h = (h ^ (h >> 13)) &* 1_274_126_177
    h ^= h >> 16
    return Double(h % 10_000) / 10_000
}

struct SceneRenderer {
    let canvas: PixelCanvas
    let recipe: SceneRecipe
    let frame: Int

    private var W: Int { PixelCanvas.width }
    private var H: Int { PixelCanvas.height }

    func draw() {
        switch recipe.place {
        case .sea(let shore): drawSea(shore)
        case .city: drawCity()
        case .interior: drawInterior()
        case .office: drawOffice()
        case .phone(let kind): drawPhone(kind)
        case .plane: drawPlane()
        case .stadium: drawStadium()
        case .court: drawCourt()
        case .bricks: drawBricks()
        }
        if recipe.rain, !isIndoor { drawRain(x: 0, y: 0, w: W, h: H) }
        if recipe.snow, !isIndoor { drawSnow(x: 0, y: 0, w: W, h: H) }
    }

    private var isIndoor: Bool {
        switch recipe.place {
        case .interior, .office, .phone, .plane: return true
        default: return false
        }
    }

    // MARK: - Небо

    private func drawSky(x: Int, y: Int, w: Int, h: Int) {
        let colors = recipe.sky
        let band = max(h / colors.count, 1)
        for (index, color) in colors.enumerated() {
            canvas.rect(x, y + index * band, w, index == colors.count - 1 ? h - index * band : band, color)
            // Шахматная кромка между полосами — классический пиксельный градиент.
            if index > 0 {
                let edge = y + index * band
                for px in stride(from: x + (index % 2), to: x + w, by: 2) {
                    canvas.dot(px, edge - 1, color)
                }
            }
        }
        if recipe.stars {
            for i in 0..<24 {
                let sx = x + Int(pixelNoise(i, 1) * Double(w))
                let sy = y + Int(pixelNoise(i, 2) * Double(h) * 0.6)
                if pixelNoise(i, frame / 6) > 0.25 { canvas.dot(sx, sy, E32.cloud) }
            }
        }
        if let sun = recipe.sun {
            drawDisc(cx: x + w * 3 / 4, cy: y + h / 3, r: max(h / 8, 3), color: sun)
        }
        if recipe.seagulls {
            for i in 0..<3 {
                let gx = x + (frame * (1 + i % 2) + i * 70) % (w + 20) - 10
                let gy = y + 10 + i * 7 + Int(sin(Double(frame + i * 9) / 5) * 2)
                drawGull(gx, gy)
            }
        }
    }

    private func drawDisc(cx: Int, cy: Int, r: Int, color: Color) {
        for dy in -r...r {
            let half = Int(Double(r * r - dy * dy).squareRoot())
            canvas.rect(cx - half, cy + dy, half * 2 + 1, 1, color)
        }
    }

    private func drawGull(_ x: Int, _ y: Int) {
        let up = (frame / 2) % 2 == 0
        canvas.dot(x - 2, up ? y - 1 : y, E32.white)
        canvas.dot(x - 1, y, E32.white)
        canvas.dot(x, y + 1, E32.white)
        canvas.dot(x + 1, y, E32.white)
        canvas.dot(x + 2, up ? y - 1 : y, E32.white)
    }

    // MARK: - Море

    private func drawSea(_ shore: SceneRecipe.Shore) {
        let horizon = 62
        let shoreY = 104
        drawSky(x: 0, y: 0, w: W, h: horizon)
        if recipe.mountains {
            for x in 0..<W {
                let height = Int(16 + 7 * sin(Double(x) * 0.06) + 4 * sin(Double(x) * 0.17 + 1))
                canvas.rect(x, horizon - height, 1, height, E32.pine)
            }
        }
        // Вода: тёмная к горизонту, светлее к берегу.
        canvas.rect(0, horizon, W, shoreY - horizon, recipe.sea[0])
        canvas.rect(0, horizon + (shoreY - horizon) / 2, W, (shoreY - horizon) / 2, recipe.sea[1])
        // Гребни волн бегут к берегу, дальние медленнее.
        for y in stride(from: horizon + 2, to: shoreY, by: 4) {
            let speed = 1 + (y - horizon) / 14
            for x in 0..<W where (x + frame * speed + y * 7) % 29 < 3 {
                canvas.dot(x, y, E32.cloud)
            }
        }
        if let sun = recipe.sun {
            // Солнечная дорожка мерцает.
            for y in stride(from: horizon + 1, to: shoreY, by: 2) where (y + frame) % 3 != 0 {
                canvas.rect(W * 3 / 4 - 3 + (y + frame) % 3, y, 5, 1, sun)
            }
        }
        // Пена дышит: берег то наступает, то отступает.
        let foam = shoreY - 1 + Int(sin(Double(frame) / 6) * 2)
        for x in 0..<W where pixelNoise(x, 3) > 0.2 {
            canvas.dot(x, foam, E32.white)
        }
        switch shore {
        case .pebbles:
            canvas.rect(0, shoreY, W, H - shoreY, E32.steel)
            for i in 0..<260 {
                let px = Int(pixelNoise(i, 4) * Double(W))
                let py = shoreY + 1 + Int(pixelNoise(i, 5) * Double(H - shoreY - 1))
                let colors = [E32.mist, E32.cloud, E32.slate]
                canvas.rect(px, py, 2, 1, colors[i % 3])
            }
        case .sand:
            canvas.rect(0, shoreY, W, H - shoreY, E32.sand)
            for i in 0..<120 {
                canvas.dot(Int(pixelNoise(i, 6) * Double(W)), shoreY + 1 + Int(pixelNoise(i, 7) * Double(H - shoreY - 1)), E32.tan)
            }
        case .rocks:
            canvas.rect(0, shoreY, W, H - shoreY, E32.slate)
            for i in 0..<6 {
                let rx = i * 32 + Int(pixelNoise(i, 8) * 12)
                let rh = 8 + Int(pixelNoise(i, 9) * 14)
                canvas.rect(rx, shoreY - rh / 2, 18 + i % 3 * 4, rh, E32.navy)
                canvas.rect(rx + 2, shoreY - rh / 2, 10, 2, E32.steel)
            }
        }
        if recipe.palms {
            for px in [22, 150] { drawPalm(px, shoreY) }
        }
        if recipe.neon {
            // Фонари бульвара мигают по очереди.
            for i in 0..<6 {
                let lx = 10 + i * 30
                canvas.rect(lx, shoreY - 18, 1, 18, E32.navy)
                canvas.rect(lx - 1, shoreY - 20, 3, 2, (frame / 4 + i) % 5 == 0 ? E32.magenta : E32.lemon)
            }
        }
    }

    private func drawPalm(_ x: Int, _ ground: Int) {
        canvas.rect(x, ground - 34, 2, 34, E32.brown)
        let sway = Int(sin(Double(frame) / 8) * 1.5)
        for (dx, dy) in [(-8, 0), (-5, -2), (0, -3), (5, -2), (8, 0)] {
            canvas.rect(x + dx + sway - 2, ground - 36 + dy, 6, 2, E32.green)
        }
    }

    // MARK: - Улица

    private func drawCity() {
        let ground = 100
        drawSky(x: 0, y: 0, w: W, h: ground)
        var x = -2
        var index = 0
        while x < W {
            let width = 14 + Int(pixelNoise(index, 11) * 18)
            let height = 26 + Int(pixelNoise(index, 12) * 44)
            let color = recipe.buildings[index % recipe.buildings.count]
            canvas.rect(x, ground - height, width, height, color)
            if recipe.sun != nil {
                // Португальские крыши — терракота.
                canvas.rect(x, ground - height - 2, width, 2, E32.rust)
            }
            for wy in stride(from: ground - height + 4, to: ground - 6, by: 7) {
                for wx in stride(from: x + 3, to: x + width - 3, by: 5) {
                    let lit = pixelNoise(wx, wy, frame / 40) > 0.5
                    canvas.rect(wx, wy, 2, 3, lit ? recipe.windowLight : E32.night)
                }
            }
            x += width + 1
            index += 1
        }
        canvas.rect(0, ground, W, H - ground, recipe.street)
        if recipe.rain {
            // Мокрый асфальт отражает окна.
            for i in 0..<18 where (i + frame / 3) % 4 != 0 {
                canvas.rect(Int(pixelNoise(i, 13) * Double(W)), ground + 4 + i % 5 * 6, 6, 1, recipe.windowLight.opacity(0.5))
            }
        }
        if recipe.neon {
            let blink = (frame / 5) % 3 != 0
            canvas.rect(20, ground - 30, 22, 6, blink ? E32.magenta : E32.purple)
            canvas.rect(120, ground - 44, 16, 5, blink ? E32.cyan : E32.ocean)
        }
        // Прохожий идёт через кадр.
        let walker = (frame / 2) % (W + 20) - 10
        drawPerson(walker, ground + 12, E32.night)
    }

    private func drawPerson(_ x: Int, _ feet: Int, _ color: Color) {
        canvas.rect(x + 1, feet - 16, 4, 4, color)
        canvas.rect(x, feet - 12, 6, 9, color)
        let step = (frame / 2) % 2
        canvas.rect(x + step, feet - 3, 2, 3, color)
        canvas.rect(x + 4 - step, feet - 3, 2, 3, color)
    }

    // MARK: - Комната

    private func drawInterior() {
        let floorY = 100
        canvas.rect(0, 0, W, floorY, recipe.wall)
        canvas.rect(0, floorY, W, H - floorY, recipe.floor)
        canvas.rect(0, floorY - 2, W, 2, E32.night.opacity(0.4))
        // Окно: что за ним — зависит от места.
        let wx = 108, wy = 16, ww = 54, wh = 42
        canvas.rect(wx - 2, wy - 2, ww + 4, wh + 4, E32.night)
        drawWindowView(x: wx, y: wy, w: ww, h: wh)
        canvas.rect(wx + ww / 2 - 1, wy, 2, wh, E32.night)
        // Лампа с тёплым светом, который чуть дрожит.
        let glow = 0.18 + 0.04 * sin(Double(frame) / 3)
        canvas.rect(14, 0, 1, 18, E32.night)
        canvas.rect(8, 18, 14, 5, recipe.windowLight)
        canvas.rect(0, 23, 40, 40, recipe.windowLight.opacity(glow))
        // Стол.
        canvas.rect(14, 84, 56, 3, E32.brown)
        canvas.rect(18, 87, 3, 13, E32.brown)
        canvas.rect(63, 87, 3, 13, E32.brown)
        if recipe.steam {
            canvas.rect(34, 80, 6, 4, E32.white)
            for i in 0..<3 {
                let rise = (frame + i * 3) % 9
                canvas.dot(36 + (rise / 3) % 2, 78 - rise, E32.cloud.opacity(1 - Double(rise) / 9))
            }
        }
        if recipe.suitcase {
            canvas.rect(84, 104, 40, 24, E32.rust)
            canvas.rect(84, 115, 40, 2, E32.brown)
            canvas.rect(98, 100, 12, 4, E32.night)
            // Серый кот сидит на чемодане и моргает.
            canvas.rect(110, 96, 8, 8, E32.mist)
            canvas.rect(110, 94, 2, 2, E32.mist)
            canvas.rect(116, 94, 2, 2, E32.mist)
            if frame % 24 > 1 {
                canvas.dot(112, 98, E32.night)
                canvas.dot(115, 98, E32.night)
            }
        }
        if recipe.fairyLights {
            let colors = [E32.gold, E32.pink, E32.cyan, E32.lime]
            for i in 0..<18 {
                let lx = 4 + i * 10
                let ly = 6 + Int(sin(Double(i) * 0.9) * 3)
                canvas.dot(lx, ly, colors[(i + frame / 4) % colors.count])
            }
        }
        if recipe.breath {
            let puff = frame % 16
            if puff < 8 {
                canvas.rect(78 + puff, 60 - puff / 2, 3, 2, E32.white.opacity(1 - Double(puff) / 8))
            }
        }
    }

    private func drawWindowView(x: Int, y: Int, w: Int, h: Int) {
        let horizon = y + h * 3 / 5
        let colors = recipe.sky
        let band = max((horizon - y) / colors.count, 1)
        for (index, color) in colors.enumerated() {
            canvas.rect(x, y + index * band, w, index == colors.count - 1 ? horizon - y - index * band : band, color)
        }
        if recipe.windowSea {
            canvas.rect(x, horizon, w, y + h - horizon, recipe.sea[0])
            for px in x..<(x + w) where (px + frame) % 11 < 2 {
                canvas.dot(px, horizon + 3, E32.cloud)
            }
        } else {
            for i in 0..<6 {
                let bh = 6 + Int(pixelNoise(i, 21) * 12)
                canvas.rect(x + i * 9, y + h - bh, 8, bh, recipe.buildings[i % recipe.buildings.count])
            }
        }
        if let sun = recipe.sun { canvas.rect(x + w - 12, y + 6, 5, 5, sun) }
        if recipe.snow { drawSnow(x: x, y: y, w: w, h: h) }
        if recipe.rain { drawRain(x: x, y: y, w: w, h: h) }
    }

    // MARK: - Учреждение

    private func drawOffice() {
        // Зеленоватый офисный свет — бюрократия везде одинаковая.
        canvas.rect(0, 0, W, 96, E32.cloud)
        canvas.rect(0, 0, W, 96, E32.lime.opacity(0.12))
        canvas.rect(0, 96, W, H - 96, E32.steel)
        for i in 0..<4 {
            let flicker = i == 2 && pixelNoise(frame / 3, 31) > 0.85
            canvas.rect(10 + i * 44, 4, 30, 3, flicker ? E32.mist : E32.white)
        }
        // Табло очереди: номер меняется, цифры мигают.
        canvas.rect(124, 18, 44, 18, E32.night)
        let number = (frame / 40) % 90 + 10
        let digitColor = (frame / 4) % 4 == 0 ? E32.gold : E32.red
        drawNumber(number, x: 130, y: 22, color: digitColor)
        // Стойка и окошко.
        canvas.rect(8, 64, 92, 32, E32.mist)
        canvas.rect(14, 42, 36, 22, E32.white.opacity(0.4))
        canvas.rect(60, 42, 36, 22, E32.white.opacity(0.4))
        drawPerson(28, 64, E32.navy)
        // Очередь стоит; кто-то переминается.
        for i in 0..<5 {
            let shift = i == 3 && (frame / 6) % 2 == 0 ? 1 : 0
            drawPerson(110 + i * 12 + shift, 122, [E32.slate, E32.navy, E32.brown][i % 3])
        }
        // Стулья.
        for i in 0..<4 { canvas.rect(12 + i * 18, 112, 12, 3, E32.slate) }
    }

    /// Цифры 3×5 для табло.
    private func drawNumber(_ number: Int, x: Int, y: Int, color: Color) {
        let glyphs: [[UInt8]] = [
            [7, 5, 5, 5, 7], [2, 6, 2, 2, 7], [7, 1, 7, 4, 7], [7, 1, 7, 1, 7], [5, 5, 7, 1, 1],
            [7, 4, 7, 1, 7], [7, 4, 7, 5, 7], [7, 1, 1, 1, 1], [7, 5, 7, 5, 7], [7, 5, 7, 1, 7]
        ]
        let text = Array(String(number))
        for (position, char) in text.enumerated() {
            guard let digit = char.wholeNumberValue else { continue }
            for (row, bits) in glyphs[digit].enumerated() {
                for column in 0..<3 where bits & (UInt8(4) >> column) != 0 {
                    canvas.rect(x + position * 8 + column * 2, y + row * 2, 2, 2, color)
                }
            }
        }
    }

    // MARK: - Телефон

    private func drawPhone(_ kind: SceneRecipe.PhoneKind) {
        canvas.rect(0, 0, W, H, recipe.wall.opacity(0.6))
        canvas.rect(0, 0, W, H, E32.night.opacity(0.5))
        canvas.rect(62, 8, 56, 124, E32.night)
        let sx = 66, sy = 16, sw = 48, sh = 108
        canvas.rect(sx, sy, sw, sh, E32.navy)
        switch kind {
        case .notification:
            let bounce = frame % 24 < 3 ? 2 : 0
            canvas.rect(sx + 3, sy + 6 + bounce, sw - 6, 12, E32.cloud)
            canvas.rect(sx + 6, sy + 9 + bounce, 6, 6, E32.sky)
            canvas.rect(sx + 15, sy + 10 + bounce, 22, 1, E32.steel)
            canvas.rect(sx + 15, sy + 13 + bounce, 16, 1, E32.steel)
        case .chat:
            // Сообщения прибывают снизу и уплывают вверх.
            let shift = (frame / 12) % 14
            for i in 0..<8 {
                let by = sy + sh - 10 - i * 14 + shift
                guard by > sy, by < sy + sh - 6 else { continue }
                let mine = pixelNoise(i, frame / 168) > 0.6
                let bw = 14 + Int(pixelNoise(i, 41) * 18)
                canvas.rect(mine ? sx + sw - bw - 3 : sx + 3, by, bw, 7, mine ? E32.sky : E32.cloud)
            }
        case .video:
            canvas.rect(sx, sy, sw, sh, E32.tan)
            canvas.rect(sx + 14, sy + 30, 20, 26, E32.peach)
            canvas.rect(sx + 12, sy + 26, 24, 6, E32.mist)
            if frame % 30 > 1 {
                canvas.dot(sx + 19, sy + 40, E32.night)
                canvas.dot(sx + 28, sy + 40, E32.night)
            }
            canvas.rect(sx + 21, sy + 48, 6, 1, E32.brown)
            canvas.rect(sx + 34, sy + 88, 10, 14, E32.slate)
        }
    }

    // MARK: - Самолёт

    private func drawPlane() {
        canvas.rect(0, 0, W, H, E32.cloud)
        let cx = 90, cy = 66, rx = 34, ry = 46
        for dy in -ry...ry {
            let half = Int(Double(rx) * (1 - Double(dy * dy) / Double(ry * ry)).squareRoot())
            canvas.rect(cx - half - 3, cy + dy, half * 2 + 6, 1, E32.mist)
        }
        for dy in -(ry - 4)...(ry - 4) {
            let half = Int(Double(rx - 4) * (1 - Double(dy * dy) / Double((ry - 4) * (ry - 4))).squareRoot())
            let t = Double(dy + ry) / Double(ry * 2)
            let color = t < 0.5 ? E32.sky : E32.cyan
            canvas.rect(cx - half, cy + dy, half * 2, 1, color)
            // Облака плывут мимо иллюминатора.
            for i in 0..<4 {
                let cloudX = (i * 37 - frame) % 160
                let px = cx - 60 + (cloudX < 0 ? cloudX + 160 : cloudX)
                let py = cy - 20 + i * 13
                if dy == py - cy || dy == py - cy + 1 {
                    let left = max(px, cx - half), right = min(px + 22, cx + half)
                    if right > left { canvas.rect(left, cy + dy, right - left, 1, E32.white) }
                }
            }
        }
    }

    // MARK: - Стадион, падел, Леголенд

    private func drawStadium() {
        canvas.rect(0, 0, W, 40, E32.night)
        for lx in [20, 160] {
            canvas.rect(lx, 6, 1, 30, E32.slate)
            canvas.rect(lx - 4, 4, 9, 3, (frame / 10) % 2 == 0 ? E32.white : E32.lemon)
        }
        // Трибуны: шарфы «Спортинга» поднимаются волной.
        for row in 0..<6 {
            for col in 0..<45 {
                let wave = (col + frame) % 30 < 4 ? -1 : 0
                let color = (col + row) % 2 == 0 ? E32.green : E32.white
                canvas.rect(col * 4, 40 + row * 6 + wave, 3, 3, color)
            }
        }
        canvas.rect(0, 78, W, H - 78, E32.lime)
        for x in stride(from: 0, to: W, by: 20) { canvas.rect(x, 78, 10, H - 78, E32.green) }
        canvas.rect(88, 78, 2, H - 78, E32.white)
    }

    private func drawCourt() {
        drawSky(x: 0, y: 0, w: W, h: 50)
        canvas.rect(0, 50, W, H - 50, E32.ocean)
        canvas.rect(10, 56, W - 20, H - 66, E32.sky)
        canvas.rect(W / 2 - 1, 46, 2, 40, E32.white)
        for x in stride(from: 10, to: W - 10, by: 4) { canvas.dot(x, 70, E32.white) }
        // Мяч летает над сеткой.
        let t = Double(frame % 32) / 32
        let bx = 30 + Int(t * Double(W - 60))
        let by = 70 - Int(sin(t * .pi) * 40)
        canvas.rect(bx, by, 3, 3, E32.lemon)
    }

    private func drawBricks() {
        drawSky(x: 0, y: 0, w: W, h: 90)
        let colors = [E32.red, E32.gold, E32.sky, E32.lime, E32.white]
        for i in 0..<40 {
            let bx = (i % 10) * 18
            let by = 90 + (i / 10) * 11
            canvas.rect(bx, by, 17, 10, colors[(i * 7) % colors.count])
            canvas.rect(bx + 3, by - 2, 4, 2, colors[(i * 7) % colors.count])
            canvas.rect(bx + 10, by - 2, 4, 2, colors[(i * 7) % colors.count])
        }
        // Горка и вагончик.
        for x in 0..<W {
            let y = 50 + Int(sin(Double(x) / 18) * 18)
            canvas.dot(x, y, E32.night)
        }
        let cx = (frame * 2) % W
        let cy = 50 + Int(sin(Double(cx) / 18) * 18)
        canvas.rect(cx - 4, cy - 5, 8, 5, E32.red)
    }

    // MARK: - Погода

    private func drawRain(x: Int, y: Int, w: Int, h: Int) {
        let count = max(w * h / 260, 6)
        for i in 0..<count {
            let rx = x + (Int(pixelNoise(i, 51) * Double(w)) + frame) % w
            let ry = y + (Int(pixelNoise(i, 52) * Double(h)) + frame * 6) % h
            canvas.rect(rx, ry, 1, min(3, y + h - ry), E32.cloud.opacity(0.7))
        }
    }

    private func drawSnow(x: Int, y: Int, w: Int, h: Int) {
        let count = max(w * h / 380, 5)
        for i in 0..<count {
            let drift = Int(sin(Double(frame + i * 11) / 9) * 2)
            let sx = x + (Int(pixelNoise(i, 61) * Double(w)) + drift + w) % w
            let sy = y + (Int(pixelNoise(i, 62) * Double(h)) + frame / 2) % h
            canvas.dot(sx, sy, E32.white)
        }
    }
}
