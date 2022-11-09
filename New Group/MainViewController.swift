//
//  VC.swift
//  AlamofireApiTableViewSearch
//
//  Created by Sergio on 8.11.22.
//

import UIKit
import Alamofire

final class MainViewController : UIViewController {

    var presenter: MainViewPresenterProtocol!
    var url = "https://api.magicthegathering.io/v1/cards"
    var timer: Timer?

    //MARK: - UIElements

    private let searchController = UISearchController(searchResultsController: nil)

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVc()
        setupHierarchy()
        setupLayout()
        setupDelegate()
        setupNavigationBar()
    }

    // MARK: - Setup

    func configureVc() {
        presenter = MainPresenter(view: self)
        presenter.fetchSeries(url: url)
    }

    func setupDelegate() {
        tableView.delegate = self
        tableView.dataSource = self

        searchController.searchBar.delegate = self
    }

    func setupNavigationBar() {
        navigationItem.title = "Albums cards"

        navigationItem.searchController = searchController
    }

    private func setupSearchController() {
        searchController.searchBar.placeholder = "Search"
        searchController.obscuresBackgroundDuringPresentation = false
    }

    private func setupHierarchy() {
        view.addSubview(tableView)
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

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.returnCardsCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell
        cell?.character = presenter.getUsedCards(at: indexPath.row)
        return cell ?? UITableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Metric.heightCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailPresenter = DetailPresenter()
        let detailAlbumViewController = DetailAlbumViewController(presenter: detailPresenter)
        detailPresenter.detailView = detailAlbumViewController
        detailAlbumViewController.presenter.showCard(model: presenter.getUsedCards(at: indexPath.row))
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.present(detailAlbumViewController, animated: true)
    }
}

// MARK: - UISearchBarDelegate

extension MainViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        let text = searchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)

        if text != "" {
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [weak self ] _ in
                self?.url = "https://api.magicthegathering.io/v1/cards?name=\(searchText)"
                self?.presenter.fetchSeries(url: self?.url ?? "")
            })
        } else {
            let urlString = url
            presenter.fetchSeries(url: urlString)
        }
    }
}
