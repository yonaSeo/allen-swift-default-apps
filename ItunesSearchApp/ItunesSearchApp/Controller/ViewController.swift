//
//  ViewController.swift
//  ItunesSearchApp
//
//  Created by yona on 12/16/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var musicList: [Music]? // 빈 배열이 아니어도 됨
    // var searchController = UISearchController()
//    let searchController = UISearchController(searchResultsController: UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchResultViewController") as! SearchResultViewController)
    let searchController = UISearchController(searchResultsController: UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchResultNibViewController") as! SearchResultNibViewController)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Music"
        setupData()
        setupTableView()
        setupSearchBar()
    }

    func setupData() {
        NetworkManager.shared.fetchMusic(searchKeyword: "yoasobi") { result in
            switch result {
            case .success(let musicList):
                self.musicList = musicList
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: Cell.musicCellItendifier, bundle: nil), forCellReuseIdentifier: Cell.musicCellItendifier)
    }
    
    func setupSearchBar() {
        self.navigationItem.searchController = searchController
        // searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .none
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.musicCellItendifier, for: indexPath) as! MusicCell
        let music = musicList?[indexPath.row]
        
        cell.imageURL = music?.imageURL
        cell.songNameLabel.text = music?.songName
        cell.artistNameLabel.text = music?.artistName
        cell.albumNameLabel.text = music?.albumName
        cell.releaseDateLabel.text = music?.releaseDateString
        
        cell.selectionStyle = .none
                
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120 // UITableView.automaticDimension
    }
}

//extension ViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        self.musicList = []
//        NetworkManager.shared.fetchMusic(searchKeyword: searchText) { result in
//            switch result {
//            case .success(let musicList):
//                self.musicList = musicList
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
//    
////    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
////        self.musicList = []
////        NetworkManager.shared.fetchMusic(searchKeyword: searchBar.text ?? "") { result in
////            switch result {
////            case .success(let musicList):
////                self.musicList = musicList
////                DispatchQueue.main.async {
////                    self.tableView.reloadData()
////                }
////            case .failure(let error):
////                print(error.localizedDescription)
////            }
////        }
////    }
//}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // print("\(searchController.searchBar.text as Any)")
        // let vc = searchController.searchResultsController as! SearchResultViewController
        let vc = searchController.searchResultsController as! SearchResultNibViewController
        vc.searchTerm = searchController.searchBar.text ?? ""
    }
}
