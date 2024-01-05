//
//  ViewController.swift
//  MusicMVVM
//
//  Created by yona on 12/26/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var songNameLabel: UILabel!
    @IBOutlet private weak var albumNameLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    
    var viewModel: MusicViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self.viewModel = MusicViewModel()
        viewModel.onCompleted = { [weak self] in
            DispatchQueue.main.async {
                self?.songNameLabel.text = self?.viewModel.songName
                self?.albumNameLabel.text = self?.viewModel.albumName
                self?.releaseDateLabel.text = self?.viewModel.releasedDate
            }
        }
    }

    @IBAction func startButtonTapped(_ sender: UIButton) {
        viewModel.handleStartButtonTapped()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
//        let detailVM = DetailViewModel()
//        detailVM.music = self.viewModel.music
        
//        let detailVC = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
//        detailVC.viewModel = viewModel.getDetailViewModel()
//        present(detailVC, animated: true)
        viewModel.presentDetailVC(storyboard: storyboard, viewController: self)
    }
}

