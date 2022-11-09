//
//  DetailPresenter.swift
//  AlamofireApiTableViewSearch
//
//  Created by Sergio on 8.11.22.
//

import Foundation

protocol DetailPresenterProtocol {
    func showCard(model: Card)
}

class DetailPresenter: DetailPresenterProtocol {

    weak var detailView: DetailAlbumViewController?

    func showCard(model: Card) {

        let nameLabel = "Name: \(model.name ?? "")"
        let typeLabel = "Label: \(model.type ?? "")"
        let setNameLabel = "SetName: \(model.setName ?? "")"
        let artistLabel = "Artist: \(model.artist ?? "")"
        let powerLabel = "Power: \(model.power ?? "no power")"
        let imageUrl = model.imageUrl
        
        detailView?.setModel(
            name: nameLabel,
            type: typeLabel,
            setName: setNameLabel,
            artist: artistLabel,
            power: powerLabel,
            imageUrl: imageUrl)
    }
}
