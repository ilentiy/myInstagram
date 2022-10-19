//
//  ViewController.swift
//  myInstagram
//
//  Created by Илья on 17.10.2022.
//

import UIKit

/// Лента Инстаграма
final class MainViewController: UIViewController {
    
    // MARK: - Private IBOutlets
    @IBOutlet private weak var intagramTableView: UITableView!
    
    // MARK: - Private Property
    private let refresher = UIRefreshControl()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        refresher.addTarget(self, action: #selector(refresherAction), for: .valueChanged)
        intagramTableView.addSubview(refresher)
    }
    
    // MARK: - Private Actions
    @objc func refresherAction() {
        refresher.endRefreshing()
    }
}

/// UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    
}

/// UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "Story", for: indexPath)
        case 3:
            cell = tableView.dequeueReusableCell(withIdentifier: "Recomend", for: indexPath)
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: "Post", for: indexPath)
        }
        return cell
    }
}
