//
//  Model.swift
//  AlamofireApiTableViewSearch
//
//  Created by Sergio on 2.11.22.
//

import Foundation

struct Characters: Decodable {
    let cards: [Card]
}

struct Card: Decodable {
    let name: String?
    let type: String?
    let setName: String?
    let artist: String?
    let power: String?
    let imageUrl: String?
}
