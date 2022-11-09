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
    func searchCards(searchText: String)
}

final class MainPresenter: MainViewPresenterProtocol {

    private weak var view: MainViewController?
    private var cards: [Card] = []
    private var url = ""
    private var timer: Timer?

    required init(view: MainViewController) {
        self.view = view
    }

    // MARK: - Setups
    
    func fetchSeries(url: String) {
        let request = AF.request(url)
        request.responseDecodable(of: Characters.self) { [weak self ] data in
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

    func searchCards(searchText: String) {
        let text = searchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)

        if text != "" {
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [weak self ] _ in
                self?.url = "https://api.magicthegathering.io/v1/cards?name=\(searchText)"
                self?.fetchSeries(url: self?.url ?? "")
            })
        } else {
            let urlString = url
            fetchSeries(url: urlString)
        }
    }
}
