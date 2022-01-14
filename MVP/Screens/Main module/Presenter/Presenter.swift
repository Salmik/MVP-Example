//
//  Presenter.swift
//  MVP
//
//  Created by Zhanibek Lukpanov on 29.12.2021.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func success()
    func failure()
}

protocol MainViewPresenter: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getComments()
    var comments: [Comment]? { get set }
    func tapOnTheComment(comment: Comment?)
}

final class MainPresenter: MainViewPresenter {

    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol
    var router: RouterProtocol?

    var comments: [Comment]?

    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getComments()
    }

    func getComments() {
        networkService.getComments(completion: {[weak self] result in
            guard let self = self else { return }

            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.success()
                    print("Test merge conflict")
                case .failure(let error):
                    print(error.localizedDescription)
                    self.view?.failure()
                }
            }
        })
    }
    
    func something() {
        
    }

    func tapOnTheComment(comment: Comment?) {
        router?.showDetail(comment: comment)
    }

}
