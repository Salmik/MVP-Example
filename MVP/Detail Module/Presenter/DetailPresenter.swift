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
    init(view: DetailViewProtocol, comment: Comment?)
    var comment: Comment? { get set }
    func setComments()
}

class DetailPresenter: DetailViewPresenter {
    
    weak var view: DetailViewProtocol?
    var comment: Comment?
    
    required init(view: DetailViewProtocol, comment: Comment?) {
        self.view = view
        self.comment = comment
    }
    
     func setComments() {
        self.view?.setComment(comment: comment)
    }
    
}
