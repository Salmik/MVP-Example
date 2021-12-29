//
//  ModuleBuilder.swift
//  MVP
//
//  Created by Zhanibek Lukpanov on 29.12.2021.
//

import UIKit

protocol Builder: AnyObject {
    static func createMain() -> UIViewController
}

final class ModuleBuilder: Builder {
    static func createMain() -> UIViewController {
        let model = Person(firstName: "Zhanibek", lastName: "Lukpanov")
        let view = MainViewController()
        let presenter = MainPresenter(view: view, person: model)
        view.presenter = presenter
        
        return view
    }
}
