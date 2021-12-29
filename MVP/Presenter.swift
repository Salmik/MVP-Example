//
//  Presenter.swift
//  MVP
//
//  Created by Zhanibek Lukpanov on 29.12.2021.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func setGreetin(with: String)
}

protocol MainViewPresenter: AnyObject {
    init(view: MainViewProtocol, person: Person)
    func showGreating()
}

class MainPresenter: MainViewPresenter {
    
    let view: MainViewProtocol
    let person: Person
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreating() {
        let greeting = self.person.firstName + " " + self.person.lastName
        self.view.setGreetin(with: greeting)
    }
    
}
