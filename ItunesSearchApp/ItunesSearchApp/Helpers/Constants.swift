//
//  Constants.swift
//  ItunesSearchApp
//
//  Created by yona on 12/16/23.
//

import Foundation

enum Cell {
    static let musicCellItendifier = "MusicCell"
    static let musicCollectionViewCellIdendifier = "MusicCollectionViewCell"
    static let MusicNibCollectionViewCellIdentifier = "MusicNibCollectionViewCell"
}

enum ItunesAPI {
    static let requestURL = "https://itunes.apple.com/search?"
    static let mediaMusicPram = "media=music"
}

enum CVCell {
    static let cellColumns: CGFloat = 3
    static let spacingWidth: CGFloat = 2
}
