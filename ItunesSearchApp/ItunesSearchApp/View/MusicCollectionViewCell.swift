//
//  MusicCollectionViewCell.swift
//  ItunesSearchApp
//
//  Created by yona on 12/19/23.
//

import UIKit

class MusicCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var mainImageView: UIImageView!
    
    var imageURL: String? {
        didSet {
            loadImage()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.mainImageView.image = nil
    }
    
    func loadImage() {
        guard let urlString = self.imageURL, let url = URL(string: urlString) else { return }
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            guard urlString == url.absoluteString else { return }
            DispatchQueue.main.async {
                self.mainImageView.image = UIImage(data: data)
            }
        }
    }
}
