import Foundation
import XCTest
@testable import MigrantCore

final class EndingGalleryTests: XCTestCase {
    private typealias T = TestContent

    func testFirstRecordIsNew() {
        var gallery = EndingGallery()
        XCTAssertTrue(gallery.record("broke"))
    }

    func testRepeatedRecordIsNotNew() {
        var gallery = EndingGallery()
        gallery.record("broke")
        XCTAssertFalse(gallery.record("broke"))
    }

    func testOpenedCountIgnoresEndingsRemovedFromContent() throws {
        let content = try T.make(cards: [T.event("start")])
        let gallery = EndingGallery(seen: ["broke", "happy", "deleted_in_update"])
        XCTAssertEqual(gallery.openedCount(in: content), 2)
    }

    func testEmptyGalleryOpenedNothing() throws {
        let content = try T.make(cards: [T.event("start")])
        XCTAssertEqual(EndingGallery().openedCount(in: content), 0)
    }

    func testSurvivesEncoding() throws {
        var gallery = EndingGallery()
        gallery.record("happy")
        let data = try JSONEncoder().encode(gallery)
        XCTAssertEqual(try JSONDecoder().decode(EndingGallery.self, from: data), gallery)
    }

    func testBundledEndingsAreAllReachableIds() throws {
        // Галерея считает по id: дубли id сделали бы «9 из 8».
        let ids = try ContentLoader.bundled().endings.map(\.id)
        XCTAssertEqual(Set(ids).count, ids.count)
    }
}
