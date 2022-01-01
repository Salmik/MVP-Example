//
//  ModuleBuilder.swift
//  MVP
//
//  Created by Zhanibek Lukpanov on 29.12.2021.
//

import UIKit

protocol AssemblyBuilderProtocol: AnyObject {
    func createMain(router: RouterProtocol) -> UIViewController
     func createDetailVC(comment: Comment?, router: RouterProtocol) -> UIViewController
}

final class AssemblyBuilder: AssemblyBuilderProtocol {
    
     func createMain(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }
    
     func createDetailVC(comment: Comment?, router: RouterProtocol) -> UIViewController {
        let view = DetailView()
        let presenter = DetailPresenter(view: view, comment: comment, router: router)
        view.presenter = presenter
        return view
    }
    
}
