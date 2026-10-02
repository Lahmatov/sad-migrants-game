import XCTest
@testable import MigrantCore

final class ArtMotionTests: XCTestCase {
    func testNoneDrawsNothing() {
        XCTAssertTrue(ArtMotion.particles(ArtAnimation.none, frame: 10).isEmpty)
    }

    func testEveryParticleStaysInsidePicture() {
        for kind in ArtAnimation.allCases {
            for frame in [0, 1, 7, 100, 9_999] {
                for p in ArtMotion.particles(kind, frame: frame) {
                    XCTAssertTrue((0..<ArtMotion.width).contains(p.x), "\(kind) x=\(p.x)")
                    XCTAssertTrue((0..<ArtMotion.height).contains(p.y), "\(kind) y=\(p.y)")
                    XCTAssertTrue((0...1).contains(p.alpha), "\(kind) alpha=\(p.alpha)")
                }
            }
        }
    }

    func testSameFrameGivesSamePicture() {
        for kind in ArtAnimation.allCases {
            XCTAssertEqual(ArtMotion.particles(kind, frame: 42), ArtMotion.particles(kind, frame: 42))
        }
    }

    func testEveryAnimationActuallyMoves() {
        for kind in ArtAnimation.allCases where kind != ArtAnimation.none {
            let frames = (0..<16).map { ArtMotion.particles(kind, frame: $0) }
            XCTAssertGreaterThan(Set(frames.map { "\($0)" }).count, 1, "\(kind) стоит на месте")
        }
    }

    func testRainFallsDown() {
        let before = ArtMotion.particles(.rain, frame: 0)[0]
        let after = ArtMotion.particles(.rain, frame: 1)[0]
        XCTAssertEqual((after.y - before.y + ArtMotion.height) % ArtMotion.height, 6)
    }

    func testNegativeFrameIsTreatedAsStart() {
        XCTAssertEqual(ArtMotion.particles(.snow, frame: -5), ArtMotion.particles(.snow, frame: 0))
    }

    func testAnimationNamesDecodeFromArtJSON() throws {
        let decoded = try JSONDecoder().decode([String: ArtAnimation].self, from: Data(#"{"a":"rain","b":"none"}"#.utf8))
        XCTAssertEqual(decoded, ["a": ArtAnimation.rain, "b": ArtAnimation.none])
    }
}
