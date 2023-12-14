//
//  ViewController.swift
//  MemberList
//
//  Created by yona on 12/11/23.
//

import UIKit

final class ViewController: UIViewController {
    private var tableView = UITableView()
    let memberListManager = MemberListManager()
    
    lazy var addBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonTapped))
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupNavigationBar()
        setupMemberListManager()
        setupTableView()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        tableView.reloadData()
//    }
    
    func setupNavigationBar() {
        self.title = "회원 목록"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.compactAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        self.navigationItem.rightBarButtonItem = addBarButton
    }
    
    func setupMemberListManager() {
        memberListManager.initializeMemberList()
    }

    func setupTableView() {
        self.view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MemberTableViewCell.self, forCellReuseIdentifier: "MemberCell")
        
        tableView.rowHeight = 100
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    @objc func addBarButtonTapped() {
        let detailVC = DetailViewController()
        detailVC.delegate = self
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberListManager.getMemberList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! MemberTableViewCell
        cell.member = memberListManager[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.member = memberListManager[indexPath.row]
        detailVC.delegate = self
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ViewController: MemberDelegate {
    func insertMember(_ member: Member) {
        memberListManager.insertMember(member)
        tableView.reloadData()
        dump(member)
    }
    
    func updateMember(idx: Int, _ member: Member) {
        memberListManager.updateMember(idx: idx, member)
        tableView.reloadData()
    }
}
