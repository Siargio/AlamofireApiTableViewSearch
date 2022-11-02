//
//  CustomTableViewCell.swift
//  AlamofireApiTableViewSearch
//
//  Created by Sergio on 2.11.22.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {

    // MARK: - UIElements

    private let characterImage: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let role = UILabel(font: Metric.fontLabelTableView)

    private let name = UILabel(font: Metric.fontLabelTableView)

    //MARK: - LifeCycle

    override func layoutSubviews() {
        super.layoutSubviews() // для того чтобы при загрузке ячейки мы снова перерисовывали для альбома размеры

        characterImage.layer.cornerRadius = characterImage.frame.width / 2
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Setups

    var character: Card? {
        didSet {
            role.text = character?.name
            name.text = character?.type
            DispatchQueue.global().async {  //
                guard let imagePath = self.character?.imageUrl,
                      let imageURL = URL(string: imagePath),
                      let imageData = try? Data(contentsOf: imageURL)
                else {
                    DispatchQueue.main.async {  //
                        self.characterImage.image = UIImage(named: "square-image")
                    }
                        return
                }
                DispatchQueue.main.async {  //
                    self.characterImage.image = UIImage(data: imageData)
                }
            }
        }
    }

    private func setupHierarchy() {
        self.addSubview(characterImage)
        self.addSubview(role)
        self.addSubview(name)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            characterImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            characterImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            characterImage.heightAnchor.constraint(equalToConstant: 60),
            characterImage.widthAnchor.constraint(equalToConstant: 60),

            role.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -15),
            role.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: 20),

            name.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            name.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: 20),
            name.topAnchor.constraint(equalTo: role.bottomAnchor, constant: 10)
            ])
    }
}
