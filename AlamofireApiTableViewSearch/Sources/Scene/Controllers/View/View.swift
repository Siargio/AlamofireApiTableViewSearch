////
////  View.swift
////  AlamofireApiTableViewSearch
////
////  Created by Sergio on 2.11.22.
////
//
//import UIKit
//import Alamofire
//
//final class MainView: UIView {
//
//    var characters: [Card] = []
//    var timer: Timer?
//    
//    // MARK: - UIElements
//
//     let tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.backgroundColor = .white
//        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        return tableView
//    }()
//
//    private let searchController = UISearchController(searchResultsController: nil)
//
//    init() {
//        super.init(frame: .zero)
//        commonInit()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        commonInit()
//
//    }
//
//    private func commonInit() {
//        setupHierarchy()
//        setupLayout()
//        fetchSeries()
//    }
//
//    // MARK: - Setup
//
//    private func setupHierarchy() {
//       addSubview(tableView)
//    }
//
//    private func setupDelegate() {
//        tableView.delegate = self
//        tableView.dataSource = self
//
//        //searchController.searchBar.delegate = self
//    }
//
//    func fetchSeries() {
//        let request = AF.request("https://api.jikan.moe/v4/manga/50/characters")
//        request.responseDecodable(of: Characters.self) { (data) in
//            guard let char = data.value else { return }
//            let characterss = char.data
//            //self.mainView?.characters = characterss
//            self.characters = characterss
//            //self.mainView?.tableView.reloadData()
//            self.tableView.reloadData()
//        }
//    }
//
//
//    private func setupSearchController() {
//        searchController.searchBar.placeholder = "Search"
//        searchController.obscuresBackgroundDuringPresentation = false
//    }
//
//    private func setupLayout() {
//        NSLayoutConstraint.activate([
//            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            tableView.topAnchor.constraint(equalTo: self.topAnchor),
//            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//        ])
//    }
//}
//
//// MARK: - UITableViewDataSource
//
//extension MainView: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        20
//        //characters.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell
//
//        cell?.character = characters[indexPath.row]
//        return cell ?? UITableViewCell()
//    }
//}
//
//// MARK: - UITableViewDelegate
//
//extension MainView: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        70
//    }
//}
//
// //MARK: - UISearchBarDelegate
//
//extension MainView: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//        let text = searchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
//
//        if text != "" {
//            timer?.invalidate()
//            //timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [weak self ] _ in self?.fetchAlbums(albumName: text ?? "")
//            //})
//        }
//    }
//}
