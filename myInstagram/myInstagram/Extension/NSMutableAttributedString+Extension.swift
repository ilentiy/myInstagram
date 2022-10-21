//
//  NSMutableAttributedString+Extension.swift
//  myInstagram
//
//  Created by Илья on 21.10.2022.
//

import UIKit

/// Расширение для AttributedString
extension NSMutableAttributedString {
    enum Fonts {
        static let bold = "Helvetica-Bold"
        static let regular = "Helvetica-Regular"
    }
    
    var fontSize: CGFloat {
        13
    }
    
    var boldFont: UIFont {
        UIFont(name: Fonts.bold, size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize)
    }
    
    var normalFont: UIFont {
        UIFont(name: Fonts.regular, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    func bold(_ value: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: boldFont
        ]
        append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func normal(_ value: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: normalFont,
        ]
        append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func normalGray(_ value: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: normalFont,
            .foregroundColor: UIColor.gray,
        ]
        append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
}
