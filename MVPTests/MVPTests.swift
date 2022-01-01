//
//  MVPTests.swift
//  MVPTests
//
//  Created by Zhanibek Lukpanov on 29.12.2021.
//

import XCTest
@testable import MVP

// MARK: - MockView
class MockView: MainViewProtocol {
    
    func success() {
        
    }
    
    func failure() {
        
    }

}

// MARK: - MockNetworkService
class MockNetworkService: NetworkServiceProtocol {
    var comments: [Comment]!
    
    init() { }
    
    convenience init(comments: [Comment]?) {
        self.init()
        self.comments = comments
    }
    
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void) {
        if let comments = comments {
            completion(.success(comments))
        } else {
            let error = NSError(domain: "", code: 0, userInfo: nil)
            completion(.failure(error))
        }
    }
    
}

// MARK: - MVPTests
class MVPTests: XCTestCase {
    
    var view: MockView!
    var presenter: MainPresenter!
    var networkService: NetworkServiceProtocol!
    var router: RouterProtocol!
    var comments = [Comment]()

    override func setUp() {
        let navVC = UINavigationController()
        let assemblyBuilder = AssemblyBuilder()
        router = Router(navigationController: navVC, assemblyBuilder: assemblyBuilder)
    }

    override func tearDown() {
        view = nil
        networkService = nil
        presenter = nil
    }
    
    func testGetSuccessComments() {
        let comment = Comment(postId: 1, id: 2, name: "Bar", email: "Baz", body: "Foo")
        comments.append(comment)
        
        view = MockView()
        networkService = MockNetworkService(comments: comments)
        presenter = MainPresenter(view: view, networkService: networkService, router: router)
        
        var catchComments: [Comment]?
        
        networkService.getComments { result in
            switch result {
            case .success(let comments): catchComments = comments
            case .failure(let error): print(error)
                
            }
        }
        
        XCTAssertNotEqual(catchComments?.count, 0)

    }

}
