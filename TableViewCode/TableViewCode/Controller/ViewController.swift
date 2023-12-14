//
//  ViewController.swift
//  TableViewCode
//
//  Created by yona on 12/6/23.
//

import UIKit

final class ViewController: UIViewController {
    private var movieManager = MovieManager()
    private var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupTableView()
        setupDatas()
        setupUI()
    }
    
    func setupNavigation() {
        self.title = "영화목록"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieCell")
    }
    
    func setupDatas() {
        movieManager.setMovies()
    }
    
    func setupUI() {
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieManager.getMovies().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        let movie = movieManager.getMovies()[indexPath.row]
        
        cell.movieImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.movieDescriptionLabel.text = movie.movieDescription
        cell.selectionStyle = .none
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.movie = movieManager.getMovies()[indexPath.row]
        show(detailVC, sender: nil)
        //navigationController?.pushViewController(detailVC, animated: true)
        
    }
}
