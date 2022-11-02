//
//  ViewController.swift
//  AlamofireApiTableViewSearch
//
//  Created by Sergio on 2.11.22.
//

import UIKit
import Alamofire

// MARK: - UIElements

 class ViewController: UIViewController {

     var characters: [Card] = []
     var timer: Timer?

     // MARK: - UIElements

      let tableView: UITableView = {
         let tableView = UITableView()

         tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
         tableView.translatesAutoresizingMaskIntoConstraints = false
         return tableView
     }()

     private let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupDelegate()
        setNavigationBar()
        setupHierarchy()
        setupLayout()
        fetchSeries()
    }

     // MARK: - Setup

     private func setupHierarchy() {
         view.addSubview(tableView)
     }

     private func setupDelegate() {
         tableView.delegate = self
         tableView.dataSource = self

         searchController.searchBar.delegate = self
     }

     private func setNavigationBar() {
         navigationItem.title = "Albums"
         navigationItem.searchController = searchController
     }

     private func setupSearchController() {
         searchController.searchBar.placeholder = "Search"
         searchController.obscuresBackgroundDuringPresentation = false
     }

     func fetchSeries() {
         let request = AF.request("https://api.magicthegathering.io/v1/cards")
         request.responseDecodable(of: Characters.self) { (data) in
             guard let char = data.value else { return }
             let characters = char.cards
             self.characters = characters
             self.tableView.reloadData()
         }
     }

     private func setupLayout() {
         NSLayoutConstraint.activate([
             tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             tableView.topAnchor.constraint(equalTo: view.topAnchor),
             tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
         ])
     }
 }

 // MARK: - UITableViewDataSource

 extension ViewController: UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         characters.count
     }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell
         cell?.character = characters[indexPath.row]
         return cell ?? UITableViewCell()
     }
 }

 // MARK: - UITableViewDelegate

 extension ViewController: UITableViewDelegate {
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         70
     }
         func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             let detailAlbumViewController = DetailAlbumViewController()
             let card = characters[indexPath.row]
             detailAlbumViewController.card = card
             tableView.deselectRow(at: indexPath, animated: true)
             navigationController?.present(detailAlbumViewController, animated: true)
         }
     }

//MARK: - UISearchBarDelegate

extension ViewController: UISearchBarDelegate {
   func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

       let text = searchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)

       if text != "" {
           timer?.invalidate()
           //timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [weak self ] _ in self?.fetchSeries(albumName: text ?? "")
           //})
       }
   }
}
