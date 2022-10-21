//
//  NSMutableAttributedString+Extension.swift
//  myInstagram
//
//  Created by Илья on 21.10.2022.
//

import UIKit

/// Расширение для AttributedString
extension NSMutableAttributedString {
    
    var fontSize: CGFloat {
        13
    }
    
    var boldFont: UIFont {
        UIFont(name: "Helvetica-Bold", size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize)
    }
    
    var normalFont: UIFont {
        UIFont(name: "Helvetica-Regular", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
        
    }
    
    func bold(_ value: String) -> NSMutableAttributedString {
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: boldFont
        ]
        
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func normal(_ value: String) -> NSMutableAttributedString {
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: normalFont,
        ]
        
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func normalGray(_ value: String) -> NSMutableAttributedString {
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: normalFont,
            .foregroundColor: UIColor.gray,
        ]
        
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
}
