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

/// Модель пользователя
struct User {
    let name: String
    let avatar: String
}

/// Модель комментария
struct Comment: Action {
    var user: User
    var action: String
    var post: String
    var date: String
}

/// Модель подписки
struct Subcribe: Action {
    var user: User
    var action: String
    var date: String
    var isSubsribe: Bool
}
