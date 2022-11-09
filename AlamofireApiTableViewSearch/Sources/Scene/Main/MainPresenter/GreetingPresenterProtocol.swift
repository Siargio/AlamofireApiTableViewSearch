//
//  GreetingPresenterProtocol.swift
//  AlamofireApiTableViewSearch
//
//  Created by Sergio on 6.11.22.
//

import Foundation
import Alamofire

protocol PresenterView: AnyObject {

//    init(view: MainViewController, cards: [Card]) //инициализация вьюконтроллера и модели
    func fetchSeries(url: String)
//    func returnCardsCount() -> Int
}

 class GreetingPresenter: PresenterView {

//     required init(view: MainViewController, cards: [Card]) {
//        self.view = view
//        self.cards = cards
//    }

   weak var view: PresenterView?

     init(view: PresenterView) {
         self.view = view
     }

    //private var characters: Characters
    var url = "https://api.magicthegathering.io/v1/cards"
    var cards: [Card] = []

    func returnCardsCount() -> Int {
        return cards.count
    }

    func fetchSeries(url: String) {
        let request = AF.request(url)
        request.responseDecodable(of: Characters.self) { [weak self ]data in
            guard let char = data.value else { return }
            let characters = char.cards
            self?.cards = characters

            //self?.view.tableView.reloadData()
        }
    }
}
