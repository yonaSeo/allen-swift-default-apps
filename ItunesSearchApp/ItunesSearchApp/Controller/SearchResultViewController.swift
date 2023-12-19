//
//  SearchResultViewController.swift
//  ItunesSearchApp
//
//  Created by yona on 12/19/23.
//

import UIKit

class SearchResultViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var musicList: [Music]?
    var searchTerm: String? {
        didSet { setupData() }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    func setupData() {
        guard let searchTerm else { return }
        self.musicList = []
        NetworkManager.shared.fetchMusic(searchKeyword: searchTerm) { result in
            switch result {
            case .success(let musicList):
                self.musicList = musicList
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        return
    }
    
    func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionCellWidth = (UIScreen.main.bounds.width - CVCell.spacingWidth * (CVCell.cellColumns - 1)) / CVCell.cellColumns
        
        flowLayout.itemSize = CGSize(width: collectionCellWidth, height: collectionCellWidth)
        flowLayout.minimumLineSpacing = CVCell.spacingWidth
        flowLayout.minimumInteritemSpacing = CVCell.spacingWidth
        flowLayout.scrollDirection = .vertical
        
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.collectionViewLayout = flowLayout
    }
}

extension SearchResultViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.musicList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.musicCollectionViewCellIdendifier, for: indexPath) as! MusicCollectionViewCell
        cell.imageURL = self.musicList?[indexPath.row].imageURL
        
        return cell
    }
}
