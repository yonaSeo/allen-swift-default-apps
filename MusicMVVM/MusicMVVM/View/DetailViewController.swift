//
//  DetailViewController.swift
//  MusicMVVM
//
//  Created by yona on 12/26/23.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet private weak var albumImageView: UIImageView!
    @IBOutlet private weak var albumNameLabel: UILabel!
    
    var viewModel: DetailViewModel! // present 할 때 viewDidLoad 호출하므로 항상 보장됨
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onCompleted = { [weak self] in
            DispatchQueue.main.async {
                self?.albumImageView.image = self?.viewModel.albumImage
            }
        }
        self.albumNameLabel.text = viewModel.albumName
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
