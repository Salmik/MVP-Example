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
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getComments()
    var comments: [Comment]? { get set }
}

class MainPresenter: MainViewPresenter {
    
    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol
    
    var comments: [Comment]?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
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
                case .failure(let error):
                    print(error.localizedDescription)
                    self.view?.failure()
                }
            }
        })
    }
    
}
