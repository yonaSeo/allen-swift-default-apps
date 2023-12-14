//
//  DetailViewController.swift
//  TableViewStoryboard
//
//  Created by yona on 12/6/23.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    public var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        movieImageView.image = movie?.movieImage
        movieNameLabel.text = movie?.movieName
        descriptionLabel.text = movie?.movieDescription
    }
}
