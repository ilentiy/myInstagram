//
//  SearchTableViewController.swift
//  myInstagram
//
//  Created by Илья on 23.10.2022.
//

import UIKit

/// Страница поиска
final class SearchTableViewController: UITableViewController {
    
    // MARK: - Constants
    enum Constans {
        enum AvatarImageNames {
            static let ilentiy = "MyPhoto"
            static let ledenev = "ledenevAvatar"
            static let mem = "memAvatar"
            static let ledenevContent = "ledenevContent1"
        }
        
        enum Identifiers {
            static let profile = "Profile"
            static let detail = "Detail"
            static let hightlights = "Highlights"
            static let posts = "Posts"
        }
        
        enum NickNames {
            static let ilentiy = "ilentiy"
            static let ledenev = "alex_ledenev"
            static let mem = "memolog"
        }
    }
    
    enum UserInfo {
        enum Ilentiy {
            static let nickname = "ilentiy"
            static let avatarImageName = "MyPhoto"
            static let posts = "15"
            static let subscribers = "124"
            static let subscriptions = "45"
            static let alias = "Шо то там откуда то там"
            static let activity = "Предприниматель"
            static let description = """
            На небе только и разговоров, что о море и о закате.
            Там говорят о том, как чертовски здорово наблюдать
            за огромным огненным шаром, как он тает в волнах.
            """
        }
    }
    
    private enum TableCellTypes {
        case profile
        case detail
        case hightlights
        case posts
    }
    
    // MARK: - Private Property
    private let tableCellTypes: [TableCellTypes] = [.profile, .detail, .hightlights, .posts]
    
    let hightlights = [
        Hightlight(name: Constans.AvatarImageNames.ilentiy, imageName: Constans.AvatarImageNames.ilentiy),
        Hightlight(name: Constans.AvatarImageNames.ledenev, imageName: Constans.AvatarImageNames.ledenev),
        Hightlight(name: Constans.AvatarImageNames.ledenevContent, imageName: Constans.AvatarImageNames.ledenevContent),
        Hightlight(name: Constans.AvatarImageNames.ilentiy, imageName: Constans.AvatarImageNames.ilentiy),
        Hightlight(name: Constans.AvatarImageNames.ledenev, imageName: Constans.AvatarImageNames.ledenev),
        Hightlight(name: Constans.AvatarImageNames.ledenevContent, imageName: Constans.AvatarImageNames.ledenevContent),
        Hightlight(name: Constans.AvatarImageNames.ilentiy, imageName: Constans.AvatarImageNames.ilentiy),
        Hightlight(name: Constans.AvatarImageNames.ledenev, imageName: Constans.AvatarImageNames.ledenev),
        Hightlight(name: Constans.AvatarImageNames.ledenevContent, imageName: Constans.AvatarImageNames.ledenevContent)
    ]
    
    let posts = [
        Constans.AvatarImageNames.ilentiy,
        Constans.AvatarImageNames.mem,
        Constans.AvatarImageNames.ilentiy,
        Constans.AvatarImageNames.ledenev,
        Constans.AvatarImageNames.ilentiy,
        Constans.AvatarImageNames.ilentiy,
        Constans.AvatarImageNames.mem,
        Constans.AvatarImageNames.ilentiy,
        Constans.AvatarImageNames.mem,
        Constans.AvatarImageNames.ilentiy,
        Constans.AvatarImageNames.ledenev,
        Constans.AvatarImageNames.ilentiy,
        Constans.AvatarImageNames.ilentiy
    ]
    
    lazy private var ilentiy = User(
        name: UserInfo.Ilentiy.nickname,
        avatar: UserInfo.Ilentiy.avatarImageName,
        mainInfo: MainInfo(
            post: UserInfo.Ilentiy.posts,
            subscriber: UserInfo.Ilentiy.subscribers,
            subscription: UserInfo.Ilentiy.subscriptions
        ),
        detailInfo: DetailInfo(
            alias: UserInfo.Ilentiy.alias,
            activity: UserInfo.Ilentiy.activity,
            description: UserInfo.Ilentiy.description
        ),
        hightlights: hightlights,
        posts: posts
    )
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

/// TableViewDataSource
extension SearchTableViewController {
    
    // MARK: - TableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        tableCellTypes.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = tableCellTypes[indexPath.section]
        switch type {
        case .profile:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constans.Identifiers.profile,
                for: indexPath) as? ProfileTableViewCell
            else { return UITableViewCell() }
            cell.updateData(ilentiy)
            return cell
        case .detail:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constans.Identifiers.detail,
                for: indexPath) as? DetailTableViewCell
            else { return UITableViewCell() }
            cell.updateData(ilentiy)
            return cell
        case .hightlights:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constans.Identifiers.hightlights,
                for: indexPath) as? HightlightTableViewCell
            else { return UITableViewCell() }
            cell.hightlights = ilentiy.hightlights
            return cell
        case .posts:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constans.Identifiers.posts,
                for: indexPath) as? PostTableViewCell
            else { return UITableViewCell() }
            cell.posts = posts
            return cell
        }
    }
}

/// Добавлет методы
extension SearchTableViewController {
    
    // MARK: - Private Methods
    private func setupUI() {
        refreshControl?.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
        navigationItem.title = ilentiy.name
    }
    
    @objc private func refreshAction() {
        refreshControl?.endRefreshing()
    }
}
