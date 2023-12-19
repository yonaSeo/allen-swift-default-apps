//
//  Music.swift
//  ItunesSearchApp
//
//  Created by yona on 12/16/23.
//

import Foundation

struct MusicData: Codable {
    let resultCount: Int?
    let results: [Music]?
}

struct Music: Codable {
    private let releaseDate: String?
    let artistName: String?
    let songName: String?
    let albumName: String?
    let previewURL: String?
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case releaseDate
        case artistName
        case songName = "trackName"
        case albumName = "collectionName"
        case previewURL = "previewUrl"
        case imageURL = "artworkUrl100"
    }
    
    var releaseDateString: String? {
        guard let isoDate = ISO8601DateFormatter().date(from: releaseDate ?? "") else { return "" }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateString = formatter.string(from: isoDate)
        return dateString
    }
}

