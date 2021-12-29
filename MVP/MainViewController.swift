//
//  ViewController.swift
//  MVP
//
//  Created by Zhanibek Lukpanov on 29.12.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    var presenter: MainViewPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        self.presenter?.showGreating()
    }

}

extension MainViewController: MainViewProtocol {
    func setGreetin(with: String) {
        greetingLabel.text = with
    }
}
