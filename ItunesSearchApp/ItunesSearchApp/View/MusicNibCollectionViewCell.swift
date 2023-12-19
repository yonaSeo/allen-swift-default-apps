//
//  MusicNibCollectionViewCell.swift
//  ItunesSearchApp
//
//  Created by yona on 12/19/23.
//

import UIKit

class MusicNibCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mainImageView: UIImageView!
    var imageURL: String? {
        didSet { loadImage() }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // self.mainImageView.contentMode = .scaleToFill
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.mainImageView.image = nil
    }

    func loadImage() {
        guard let urlString = imageURL, let url = URL(string: urlString) else { return }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else { return }
            guard urlString == url.absoluteString else { return }
            DispatchQueue.main.async {
                self.mainImageView.image = UIImage(data: imageData)
            }
        }
    }
}
