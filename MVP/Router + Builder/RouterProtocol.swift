//
//  RouterProtocol.swift
//  MVP
//
//  Created by Zhanibek Lukpanov on 30.12.2021.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initialVC()
    func showDetail(comment: Comment?)
    func popToRoot()
}

final class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialVC() {
        if let navigationController = navigationController {
            guard let mainVC = assemblyBuilder?.createMain(router: self) else { return }
            navigationController.viewControllers = [mainVC]
        }
    }
    
    func showDetail(comment: Comment?) {
        if let navigationController = navigationController {
            guard let mainVC = assemblyBuilder?.createDetailVC(comment: comment, router: self) else { return }
            navigationController.pushViewController(mainVC, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
}
