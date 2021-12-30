//
//  ModuleBuilder.swift
//  MVP
//
//  Created by Zhanibek Lukpanov on 29.12.2021.
//

import UIKit

protocol AssemblyBuilderProtocol: AnyObject {
    static func createMain() -> UIViewController
    static func createDetailVC(comment: Comment?) -> UIViewController
}

final class AssemblyBuilder: AssemblyBuilderProtocol {
    
    static func createMain() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    static func createDetailVC(comment: Comment?) -> UIViewController {
        let view = DetailView()
        let presenter = DetailPresenter(view: view, comment: comment)
        view.presenter = presenter
        return view
    }
    
}
