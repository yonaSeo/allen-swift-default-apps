//
//  ViewController.swift
//  ToDoApp
//
//  Created by yona on 12/20/23.
//

import UIKit

protocol ToDoTableViewDelegate {
    func updateButtonTapped(cell: ToDoTableViewCell)
    func reload()
}

final class ViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(ToDoTableViewCell.self, forCellReuseIdentifier: "ToDoCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupLayout()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        tableView.reloadData()
//    }
    
    func setupNavigationBar() {
        self.title = "TODO"
        
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true // large 타이틀 적용
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    }
    
    func setupLayout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    @objc func addButtonTapped() {
        let editVC = EditViewController()
        editVC.delegate = self
        show(editVC, sender: nil)
        // self.navigationController?.pushViewController(EditViewController(), animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoreDataManager.shared.getToDoList().count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoTableViewCell
        
        cell.selectionStyle = .none
        cell.toDoData = CoreDataManager.shared.getToDoList()[indexPath.row]
        
        cell.delegate = self
        
//        // cell.updateButtonTappedClosure = { [weak self] (sender) in
//        cell.updateButtonTappedClosure = { [weak self] in
//            let editVC = EditViewController()
//            editVC.toDoData = cell.toDoData
//            editVC.reloadViewController = { self?.tableView.reloadData() }
//            self?.show(editVC, sender: nil)
//            // self?.navigationController?.pushViewController(editVC, animated: true)
        
//        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ViewController: ToDoTableViewDelegate {
    func updateButtonTapped(cell: ToDoTableViewCell) {
        let editVC = EditViewController()
        editVC.toDoData = cell.toDoData
        editVC.delegate = self
        self.show(editVC, sender: nil)
    }
    
    func reload() {
        self.tableView.reloadData()
    }
}
