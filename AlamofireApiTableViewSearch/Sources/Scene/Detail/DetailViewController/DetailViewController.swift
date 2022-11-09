//
//  DetailViewController.swift
//  AlamofireApiTableViewSearch
//
//  Created by Sergio on 2.11.22.
//

import UIKit

final class DetailAlbumViewController: UIViewController {

    var presenter : DetailPresenterProtocol

    // MARK: - UIElements
    
    private let albumLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let nameLabel = UILabel(font: Metric.fontDetailLabel)

    let typeLabel = UILabel(font: Metric.fontDetailLabel)

    let setNameLabel = UILabel(font: Metric.fontDetailLabel)

    let artistLabel = UILabel(font: Metric.fontDetailLabel)

    let powerLabel = UILabel(font: Metric.fontDetailLabel)

    // MARK: - LifeCycle

    init(presenter: DetailPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setups

    private func setupHierarchy() {
        view.backgroundColor = .white
        view.addSubview(albumLogo)
        view.addSubview(nameLabel)
        view.addSubview(typeLabel)
        view.addSubview(setNameLabel)
        view.addSubview(artistLabel)
        view.addSubview(powerLabel)
    }

    func setModel(name: String, type: String, setName: String, artist: String, power: String, imageUrl: String?) {

        nameLabel.text = name
        typeLabel.text = type
        setNameLabel.text = setName
        artistLabel.text = artist
        powerLabel.text = power

        DispatchQueue.global().async {
            guard let imagePath = imageUrl,
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

    private func setupLayout() {
        NSLayoutConstraint.activate([
            albumLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Metric.albumLogoTopAnchor),
            albumLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metric.viewLeadingAnchor),
            albumLogo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Metric.viewTrailingAnchor),
            albumLogo.heightAnchor.constraint(equalToConstant: Metric.albumLogoHeightAnchor),

            nameLabel.topAnchor.constraint(equalTo: albumLogo.bottomAnchor, constant: Metric.nameLabelTopAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metric.viewLeadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Metric.viewTrailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: Metric.nameLabelHeightAnchor),

            typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Metric.typeLabelTopAnchor),
            typeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metric.viewLeadingAnchor),
            typeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Metric.viewTrailingAnchor),
            typeLabel.heightAnchor.constraint(equalToConstant: Metric.typeLabelHeightAnchor),

            setNameLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: Metric.setNameLabelTopAnchor),
            setNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metric.viewLeadingAnchor),
            setNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Metric.viewTrailingAnchor),
            setNameLabel.heightAnchor.constraint(equalToConstant: Metric.setNameLabelHeightAnchor),

            artistLabel.topAnchor.constraint(equalTo: setNameLabel.bottomAnchor, constant: Metric.artistLabelTopAnchor),
            artistLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metric.viewLeadingAnchor),
            artistLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Metric.viewTrailingAnchor),
            artistLabel.heightAnchor.constraint(equalToConstant: Metric.artistLabelHeightAnchor),

            powerLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: Metric.powerLabelTopAnchor),
            powerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metric.viewLeadingAnchor),
            powerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Metric.viewTrailingAnchor),
            powerLabel.heightAnchor.constraint(equalToConstant: Metric.powerLabelHeightAnchor),
        ])
    }
}
