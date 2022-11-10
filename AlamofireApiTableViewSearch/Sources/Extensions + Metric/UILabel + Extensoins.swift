//
//  UILabel + Extensions.swift
//  AlamofireApiTableViewSearch
//
//  Created by Sergio on 2.11.22.
//

import UIKit

extension UILabel {
    convenience init(font: Int) {
        self.init()

        self.font = UIFont.systemFont(ofSize: CGFloat(font))
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
