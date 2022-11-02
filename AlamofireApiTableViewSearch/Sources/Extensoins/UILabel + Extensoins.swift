//
//  UILabel + Extensoins.swift
//  AlamofireApiTableViewSearch
//
//  Created by Sergio on 2.11.22.
//

import UIKit

extension UILabel {
    convenience init(text: String = "", font: Int) {
        self.init()

        self.text = text
        self.font = UIFont.systemFont(ofSize: CGFloat(font))
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
