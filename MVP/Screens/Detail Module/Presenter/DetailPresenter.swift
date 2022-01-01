//
//  DetailPresenter.swift
//  MVP
//
//  Created by Zhanibek Lukpanov on 29.12.2021.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setComment(comment: Comment?)
}

protocol DetailViewPresenter: AnyObject {
    init(view: DetailViewProtocol, comment: Comment?, router: RouterProtocol)
    var comment: Comment? { get set }
    func setComments()
    func tap()
}

final class DetailPresenter: DetailViewPresenter {
    
    weak var view: DetailViewProtocol?
    var comment: Comment?
    var router: RouterProtocol?
    
    required init(view: DetailViewProtocol, comment: Comment?, router: RouterProtocol) {
        self.view = view
        self.comment = comment
        self.router = router
    }
    
     func setComments() {
        self.view?.setComment(comment: comment)
    }
    
    func tap() {
        router?.popToRoot()
    }
    
}
