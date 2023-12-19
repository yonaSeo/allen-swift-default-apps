//
//  MusicCell.swift
//  ItunesSearchApp
//
//  Created by yona on 12/16/23.
//

import UIKit

class MusicCell: UITableViewCell {
    @IBOutlet private weak var mainImageView: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    var imageURL: String? {
        didSet { loadImage() }
    }
    
    override func prepareForReuse() { // 셀 재사용 전에 호출
        super.prepareForReuse()
        self.mainImageView.image = nil // 이미지가 바뀌는 것처럼 보이는 것 방지
    }
    
    override func awakeFromNib() { // Nib의 생성자 역할 하는 메서드
        super.awakeFromNib()
        // Initialization code
        self.mainImageView.contentMode = .scaleToFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
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
