//
//  NetworkManager.swift
//  MusicMVVM
//
//  Created by yona on 12/26/23.
//

import UIKit

protocol NetworkProtocol {
    func fetchMusic(completion: @escaping (Music?) -> Void)
    func loadImage(urlString: String?, completion: @escaping (UIImage?) -> Void)
}

class NetworkManager: NetworkProtocol {
    func fetchMusic(completion: @escaping (Music?) -> Void) {
        let urlString = "https://itunes.apple.com/search?media=music&term=yoasobi"
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: urlString)!)) { data, res, err in
            guard let data else { print("Data Error"); return }
            guard err == nil else { print(err!); return }
            guard let musicData = try? JSONDecoder().decode(MusicData.self, from: data) else { print("Parse Error"); return }
            completion(musicData.results?.first)
        }.resume()
    }
    
    func loadImage(urlString: String?, completion: @escaping (UIImage?) -> Void) {
        guard let urlString else { return }
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: URL(string: urlString)!),
                  let image = UIImage(data: data) else { return }
            completion(image)
        }
    }
}
