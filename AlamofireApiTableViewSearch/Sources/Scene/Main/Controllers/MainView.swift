//
//  mainview.swift
//  AlamofireApiTableViewSearch
//
//  Created by Sergio on 6.11.22.
//

import UIKit

final class MainView: UIView {

    // MARK: - UIElements

    

    
    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        //        addSubview(nameLabel)
        //        addSubview(tickerLabel)
        //        addSubview(valueLabel)
        //        addSubview(nameButton)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
        ])
    }
}
