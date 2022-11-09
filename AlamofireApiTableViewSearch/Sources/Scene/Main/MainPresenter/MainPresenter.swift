//
//  Presenter.swift
//  AlamofireApiTableViewSearch
//
//  Created by Sergio on 8.11.22.
//

import Foundation
import Alamofire

protocol MainViewPresenterProtocol {
    func fetchSeries(url: String)
    func returnCardsCount() -> Int
    func getUsedCards(at row: Int) -> Card
}

final class MainPresenter: MainViewPresenterProtocol {

    weak var view: MainViewController?
    var cards: [Card] = []

    required init(view: MainViewController) {
        self.view = view
    }

    func fetchSeries(url: String) {
        let request = AF.request(url)
        request.responseDecodable(of: Characters.self) { [weak self ]data in
            guard let char = data.value else { return }
            let characters = char.cards
            self?.cards = characters
            self?.view?.tableView.reloadData()
        }
    }
    
    func returnCardsCount() -> Int {
        return cards.count
    }

    func getUsedCards(at row: Int) -> Card {
        cards[row]
    }
}
