//
//  Model.swift
//  AlamofireApiTableViewSearch
//
//  Created by Sergio on 2.11.22.
//

import Foundation

struct Characters: Codable {
    let cards: [Card]
}

struct Card: Codable {
    let name: String?
    let type: String?
    let setName: String?
    let artist: String?
    let power: String?
    let imageUrl: String?
}
