//
//  MVPTests.swift
//  MVPTests
//
//  Created by Zhanibek Lukpanov on 29.12.2021.
//

import XCTest
@testable import MVP

class MockView: MainViewProtocol {
    var title: String?
    func setGreetin(with: String) {
        self.title = with
    }
}

class MVPTests: XCTestCase {
    
    var view: MockView!
    var person: Person!
    var presenter: MainPresenter!

    override func setUp() {
       view = MockView()
       person = Person(firstName: "Baz", lastName: "Bar")
       presenter = MainPresenter(view: view, person: person)
    }

    override func tearDown() {
        view = nil
        person = nil
        presenter = nil
    }

    func testModuleIsNotNil() {
        XCTAssertNotNil(view, "view is not nil")
        XCTAssertNotNil(person, "person is not nil")
        XCTAssertNotNil(presenter, "presenter is not nil")
    }
    
    func testView() {
        presenter.showGreating()
        XCTAssertEqual(view.title, "Baz Bar")
    }
    
    func testPersonModel() {
        XCTAssertEqual(person.firstName, "Baz")
        XCTAssertEqual(person.lastName, "Bar")
    }

}
