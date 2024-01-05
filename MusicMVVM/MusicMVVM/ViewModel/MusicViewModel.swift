//
//  MusciViewModel.swift
//  MusicMVVM
//
//  Created by yona on 12/26/23.
//

import UIKit

class MusicViewModel {
    var networkManager: NetworkProtocol
    
    // MARK: - Model
    var music: Music? {
        didSet { self.onCompleted?() }
    }
    
    var onCompleted: (() -> Void)?
    
    // MARK: - Output
    var songName: String? {
        return music?.songName
    }
    
    var albumName: String? {
        return music?.albumName
    }
    
    var releasedDate: String? {
        return music?.releaseDateString
    }
    
    var albumImageURL: String? {
        return music?.imageURL
    }
    
    init(networkManager: NetworkProtocol) {
        self.networkManager = networkManager
    }
    
    
    // MARK: - Input
    func handleStartButtonTapped() {
        networkManager.fetchMusic { music in
            self.music = music
        }
    }
    
    
    // MARK: - Logic
//    func fetchMusic(completion: @escaping (Music?) -> Void) {
//        let urlString = "https://itunes.apple.com/search?media=music&term=yoasobi"
//        URLSession.shared.dataTask(with: URLRequest(url: URL(string: urlString)!)) { data, res, err in
//            guard let data else { print("Data Error"); return }
//            guard err == nil else { print(err!); return }
//            guard let musicData = try? JSONDecoder().decode(MusicData.self, from: data) else { print("Parse Error"); return }
//            completion(musicData.results?.first)
//        }.resume()
//    }
    
    
    // MARK: - VM generator
    func getDetailViewModel() -> DetailViewModel {
        let detailVM = DetailViewModel(networkManager: self.networkManager)
        detailVM.music = self.music
        
        return detailVM
    }
    
    func presentDetailVC(storyboard: UIStoryboard?, viewController: UIViewController) {
        let detailVM = DetailViewModel(networkManager: self.networkManager)
        detailVM.music = self.music
        
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.viewModel = detailVM
        
        viewController.present(detailVC, animated: true)
    }
}
