//
//  NotificationTableViewController.swift
//  myInstagram
//
//  Created by Илья on 20.10.2022.
//

import UIKit

/// Экран уведомления
final class NotificationTableViewController: UITableViewController {
    
    // MARK: - Constants
    enum Constans {
        enum ActionsText {
            static let comment1 = "прокоментировал(-a) ваше фото: Сильный"
            static let comment2 = "упомянул(-а) вас в комментарии: @alex_ledenev"
            static let subscribe = "подписался(-ась) на ваши обновления"
        }
        
        enum AvatarImageNames {
            static let ilentiy = "MyPhoto"
            static let ledenev = "ledenevAvatar"
            static let mem = "memAvatar"
            static let ledenevContent = "ledenevContent1"
        }
        
        enum HeadersText {
            static let today = "Сегодня "
            static let week = "На этой неделе "
            static let mounth = "В этом месяце "
            
        }
        
        enum Identifiers {
            static let comment = "Comment"
            static let subscribe = "Subscribe"
        }
        
        enum NickNames {
            static let ilentiy = "ilentiy"
            static let ledenev = "alex_ledenev"
            static let mem = "memolog"
        }
        
        enum TimeStrings {
            static let fiveHours = "5 ч."
            static let threeHours = "3 ч."
            static let nineHours = "9 ч."
            static let twoDays = "2 д."
            static let threeDays = "3 д."
            static let fourDays = "4 д."
        }
    }
    
    private enum TableCellTypes {
        case today
        case thisWeek
    }
    
    private enum ActionsItem {
        case today(items: [Action])
        case thisWeek(items: [Action])
    }
    
    // MARK: - Visual Component
    private let refresherControl = UIRefreshControl()
    
    // MARK: - Private Property
    private let tableCellTypes: [TableCellTypes] = [.today, .thisWeek]
    
    private let ilentiy = User(name: Constans.NickNames.ilentiy, avatar: Constans.AvatarImageNames.ilentiy)
    private let memolog = User(name: Constans.NickNames.mem, avatar: Constans.AvatarImageNames.mem)
    private let ledenev = User(name: Constans.NickNames.ledenev, avatar: Constans.AvatarImageNames.ledenev)
    
    private lazy var todayActions: [Action] = [
        Comment(user: ilentiy,
                action: Constans.ActionsText.comment1,
                post: Constans.AvatarImageNames.ledenevContent,
                date: Constans.TimeStrings.threeHours),
        Comment(user: memolog,
                action: Constans.ActionsText.comment2,
                post: Constans.AvatarImageNames.ledenev,
                date: Constans.TimeStrings.fiveHours),
        Comment(user: ledenev,
                action: Constans.ActionsText.comment1,
                post: Constans.AvatarImageNames.ledenevContent,
                date: Constans.TimeStrings.nineHours),
        Subcribe(user: ilentiy,
                 action: Constans.ActionsText.subscribe,
                 date: Constans.TimeStrings.nineHours,
                 isSubsribe: false)
    ]
    
    private lazy var weekAction: [Action] = [
        Subcribe(user: memolog,
                 action: Constans.ActionsText.subscribe,
                 date: Constans.TimeStrings.twoDays,
                 isSubsribe: false),
        Comment(user: ledenev,
                action: Constans.ActionsText.comment2,
                post: Constans.AvatarImageNames.ledenevContent,
                date: Constans.TimeStrings.fourDays),
        Subcribe(user: ilentiy,
                 action: Constans.ActionsText.subscribe,
                 date: Constans.TimeStrings.fourDays,
                 isSubsribe: true)
    ]
    
    lazy var actions = todayActions + weekAction
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

/// TableViewDataSource
extension NotificationTableViewController {
    
    // MARK: - TableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableCellTypes.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let type = tableCellTypes[section]
        switch type {
        case .today:
            return todayActions.count
        case .thisWeek:
            return weekAction.count
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.text = header.textLabel?.text?.capitalizedSentence
        header.textLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        header.textLabel?.textColor = .label
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let type = tableCellTypes[section]
        switch type {
        case .today:
            return Constans.HeadersText.today
        case .thisWeek:
            return Constans.HeadersText.week
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let commentCell = tableView.dequeueReusableCell(withIdentifier: Constans.Identifiers.comment,
                                                              for: indexPath) as? CommentTableViewCell
        else { return UITableViewCell() }
        
        guard let subscribeCell = tableView.dequeueReusableCell(withIdentifier: Constans.Identifiers.subscribe,
                                                                for: indexPath) as? SubscribeTableViewCell
        else { return UITableViewCell() }
        
        let type = tableCellTypes[indexPath.section]
        
        switch type {
        case .today:
            if let item = todayActions[indexPath.row] as? Comment {
                commentCell.updateData(item)
                return commentCell
            }
            
            if let item = todayActions[indexPath.row] as? Subcribe {
                subscribeCell.updateData(item)
                return subscribeCell
            }
        case .thisWeek:
            if let item = weekAction[indexPath.row] as? Comment {
                commentCell.updateData(item)
                return commentCell
            }
            
            if let item = weekAction[indexPath.row] as? Subcribe {
                subscribeCell.updateData(item)
                return subscribeCell
            }
        }
        return UITableViewCell()
    }
}

/// Добавлет методы
extension NotificationTableViewController {
    
    // MARK: - Private Methods
    private func setupUI() {
        refresherControl.addTarget(self, action: #selector(refresherAction), for: .valueChanged)
        tableView.addSubview(refresherControl)
    }
    
    @objc private func refresherAction() {
        refresherControl.endRefreshing()
    }
}
