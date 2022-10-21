//
//  String+Extension.swift
//  myInstagram
//
//  Created by Илья on 21.10.2022.
//

import Foundation

/// Расширение добавляет метод который делает первую букву предложения заглавной
extension String {
    var capitalizedSentence: String {
        "\(prefix(1).capitalized) \(dropFirst().lowercased())"
    }
}
