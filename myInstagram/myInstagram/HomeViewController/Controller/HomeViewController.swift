//
//  ViewController.swift
//  myInstagram
//
//  Created by Илья on 17.10.2022.
//

import UIKit

/// Лента Инстаграма
final class HomeViewController: UIViewController {
    
    // MARK: - Constants
    private enum Constants {
        static let storiesIdentifier = "Story"
        static let postIdentifier = "Post"
        static let recommendationIdentifier = "Recomend"
    }
    
    private enum TableCellTypes {
        case post
        case startPost
        case story
        case recomend
    }
    
    // MARK: - Private IBOutlets
    @IBOutlet private weak var intagramTableView: UITableView!
    
    // MARK: - Visual Component
    private let refresherControl = UIRefreshControl()
    
    // MARK: - Private Property
    private let tableCellTypes: [TableCellTypes] = [.story, .startPost, .recomend, .post]
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        refresherControl.addTarget(self, action: #selector(refresherAction), for: .valueChanged)
        intagramTableView.addSubview(refresherControl)
    }
    
    // MARK: - Private Actions
    @objc func refresherAction() {
        refresherControl.endRefreshing()
    }
}

/// UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        tableCellTypes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let type = tableCellTypes[section]
        switch type {
        case .story:
            return 1
        case .startPost:
            return 1
        case .recomend:
            return 1
        case .post:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        let type = tableCellTypes[indexPath.section]
        switch type {
        case .story:
            cell = tableView.dequeueReusableCell(withIdentifier: Constants.storiesIdentifier, for: indexPath)
        case .recomend:
            cell = tableView.dequeueReusableCell(withIdentifier: Constants.recommendationIdentifier, for: indexPath)
        case .post:
            cell = tableView.dequeueReusableCell(withIdentifier: Constants.postIdentifier, for: indexPath)
        case .startPost:
            cell = tableView.dequeueReusableCell(withIdentifier: Constants.postIdentifier, for: indexPath)
        }
        return cell
    }
}
