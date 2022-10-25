//
//  Comment.swift
//  myInstagram
//
//  Created by Илья on 20.10.2022.
//

import Foundation

/// Описание действия
protocol Action {
    var user: User { get set }
    var action: String { get set }
    var date: String { get set }
}

/// Информация в шапке профиля
struct MainInfo {
    let post: String
    let subscriber: String
    let subscription: String
}

/// Дополнительная информация в шапке профиля
struct DetailInfo {
    let alias: String
    let activity: String
    let description: String
}

///  Хайлайт
struct Hightlight {
    let name: String
    let imageName: String
}

/// Пользователь
struct User {
    var name: String
    var avatar: String
    var mainInfo: MainInfo?
    var detailInfo: DetailInfo?
    var hightlights: [Hightlight]?
    var posts: [String]?
}

/// Комментарий
struct Comment: Action {
    var user: User
    var action: String
    var post: String
    var date: String
}

/// Подписка
struct Subcribe: Action {
    var user: User
    var action: String
    var date: String
    var isSubsribe: Bool
}
