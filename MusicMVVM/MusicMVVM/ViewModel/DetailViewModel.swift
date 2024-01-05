//
//  DetailViewModel.swift
//  MusicMVVM
//
//  Created by yona on 12/26/23.
//

import UIKit

class DetailViewModel {
    var networkManager: NetworkProtocol
    
    // MARK: - Model
    var music: Music? {
        didSet {
            networkManager.loadImage(urlString: self.music?.imageURL) { image in
                self.albumImage = image
            }
        }
    }
    
    // MARK: - Output
    var albumName: String? {
        return music?.albumName
    }
    
    var albumImage: UIImage? {
        didSet { onCompleted?() }
    }
    
    var onCompleted: (() -> Void)?
    
    init(networkManager: NetworkProtocol) {
        self.networkManager = networkManager
    }
    
    
    // MARK: - Logic
//    func loadImage() {
//        guard let urlString = self.music?.imageURL else { return }
//        DispatchQueue.global().async { [weak self] in
//            guard let data = try? Data(contentsOf: URL(string: urlString)!),
//                  let image = UIImage(data: data) else { return }
//            self?.albumImage = image
//        }
//    }
    
}
