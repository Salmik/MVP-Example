//
//  ViewController.swift
//  MVP
//
//  Created by Zhanibek Lukpanov on 29.12.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MainViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MVP Test"
        view.backgroundColor = .systemBackground
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 110
        tableView.rowHeight = UITableView.automaticDimension
    }
    
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let comment = presenter?.comments?[indexPath.row] else { return }
        let detailVC = AssemblyBuilder.createDetailVC(comment: comment)
        navigationController?.pushViewController(detailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.comments?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let comments = presenter?.comments?[indexPath.row].body
        cell.textLabel?.text = comments
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
}

// MARK: - MainViewProtocol
extension MainViewController: MainViewProtocol {
    
    func success() {
        self.tableView.reloadData()
    }
    
    func failure() {
        print("неправильно составил запрос")
    }
    
}
