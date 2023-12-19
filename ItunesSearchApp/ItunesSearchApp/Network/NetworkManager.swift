//
//  NetworkManager.swift
//  ItunesSearchApp
//
//  Created by yona on 12/16/23.
//

import Foundation

enum NetworkError: Error {
    case networkError
    case dataError
    case parseError
}


class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    typealias NetworkCompletion =  Result<[Music]?, NetworkError>
    
    func fetchMusic(searchKeyword: String, completion: @escaping (NetworkCompletion) -> Void) {
        guard let url = URL(string: "\(ItunesAPI.requestURL)term=\(searchKeyword)&\(ItunesAPI.mediaMusicPram)") else { return }
        getMusicData(url: url) { result in
            completion(result)
        }
    }
    
    func getMusicData(url: URL, completion: @escaping (NetworkCompletion) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print(error!)
                completion(.failure(.networkError))
                return
            }
            guard let data else {
                print("Data Error")
                completion(.failure(.dataError))
                return
            }
            
            guard let musicData = try? JSONDecoder().decode(MusicData.self, from: data) else {
                print("Parse Error")
                completion(.failure(.parseError))
                return
            }
            
            completion(.success(musicData.results))
        }.resume()
    }
}
