//
//  ViewController.swift
//  TableViewStoryboard
//
//  Created by yona on 12/6/23.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = 120
        movieManager.setMovies()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        movieManager.addMovie()
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieManager.getMovies().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movie = movieManager.getMovies()[indexPath.row]
        
        cell.movieImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.descriptionLabel.text = movie.movieDescription
        cell.selectionStyle = .none
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            guard let detailVC = segue.destination as? DetailViewController else { return }
            guard let indexPath = sender as? IndexPath else { return }
            detailVC.movie = movieManager.getMovies()[indexPath.row]
        }
    }
}
