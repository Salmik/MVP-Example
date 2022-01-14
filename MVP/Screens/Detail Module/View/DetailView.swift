//
//  DetailView.swift
//  MVP
//
//  Created by Zhanibek Lukpanov on 29.12.2021.
//

import UIKit

final class DetailView: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!

    var presenter: DetailViewPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        view.backgroundColor = .systemBackground
        
        presenter?.setComments()
    }

     @IBAction func popToRootButton(_ sender: UIButton) {
         presenter.tap()
     }

 }

// MARK: - DetailViewProtocol
extension DetailView: DetailViewProtocol {
    func setComment(comment: Comment?) {
        detailLabel.text = comment?.body
    }
}
