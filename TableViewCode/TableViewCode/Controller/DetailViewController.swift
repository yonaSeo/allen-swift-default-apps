//
//  DetailViewController.swift
//  TableViewCode
//
//  Created by yona on 12/6/23.
//

import UIKit

final class DetailViewController: UIViewController {
    public var movie: Movie?
    private let detailView = DetailView()

    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        detailView.movieImageView.image = movie?.movieImage
        detailView.movieNameLabel.text = movie?.movieName
        detailView.movieDescriptionLabel.text = movie?.movieDescription
    }
}
