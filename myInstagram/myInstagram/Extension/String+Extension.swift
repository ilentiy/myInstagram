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
        
        let firstLetter = self.prefix(1).capitalized
        
        let remainingLetters = self.dropFirst().lowercased()
        
        return firstLetter + remainingLetters
    }
}
