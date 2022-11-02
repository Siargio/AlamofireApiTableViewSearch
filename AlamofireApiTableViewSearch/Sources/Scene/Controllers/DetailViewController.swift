//
//  DetailViewController.swift
//  AlamofireApiTableViewSearch
//
//  Created by Sergio on 2.11.22.
//

import UIKit

class DetailAlbumViewController: UIViewController {

    var card: Card?
    
    // MARK: - UIElements
    
    private let albumLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let nameLabel = UILabel(text:"test", font: Metric.fontDetailLabel)

    private let typeLabel = UILabel(text:"test222", font: Metric.fontDetailLabel)

    private let setNameLabel = UILabel(text:"test", font: Metric.fontDetailLabel)

    private let artistLabel = UILabel(text:"test", font: Metric.fontDetailLabel)

    private let powerLabel = UILabel(text:"test222", font: Metric.fontDetailLabel)

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHierarchy()
        setupLayout()
        setModel()
    }

    // MARK: - Setups

    private func setModel() {
        guard let character = card else { return }

        nameLabel.text = "Name: \(character.name ?? "")"
        typeLabel.text = "Label: \(character.type ?? "")"
        setNameLabel.text = "SetName: \(character.setName ?? "")"
        artistLabel.text = "Artist: \(character.artist ?? "")"
        powerLabel.text = "Power: \(character.power ?? "no power")"

        DispatchQueue.global().async {
            guard let imagePath = character.imageUrl,
                  let imageURL = URL(string: imagePath),
                  let imageData = try? Data(contentsOf: imageURL)
            else {
                DispatchQueue.main.async {
                    self.albumLogo.image = UIImage(named: "square-image")
                }
                return
            }
            DispatchQueue.main.async {
                self.albumLogo.image = UIImage(data: imageData)
            }
        }
    }

    private func setupHierarchy() {
        view.backgroundColor = .white
        view.addSubview(albumLogo)
        view.addSubview(nameLabel)
        view.addSubview(typeLabel)
        view.addSubview(setNameLabel)
        view.addSubview(artistLabel)
        view.addSubview(powerLabel)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            albumLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            albumLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            albumLogo.heightAnchor.constraint(equalToConstant: 350),
            albumLogo.widthAnchor.constraint(equalToConstant: 250),

            nameLabel.topAnchor.constraint(equalTo: albumLogo.bottomAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),

            typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            typeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            typeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            typeLabel.heightAnchor.constraint(equalToConstant: 30),

            setNameLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 15),
            setNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            setNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            setNameLabel.heightAnchor.constraint(equalToConstant: 30),

            artistLabel.topAnchor.constraint(equalTo: setNameLabel.bottomAnchor, constant: 15),
            artistLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            artistLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            artistLabel.heightAnchor.constraint(equalToConstant: 30),

            powerLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 15),
            powerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            powerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            powerLabel.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}
