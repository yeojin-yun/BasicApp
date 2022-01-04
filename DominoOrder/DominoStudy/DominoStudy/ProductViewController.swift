//
//  ProductViewController.swift
//  Domino
//
//  Created by Doyoung Song on 1/4/22.
//

import UIKit

final class ProductViewController: UIViewController {
    
    private let tableView = UITableView()
    private var list = [String]()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - Helpers
extension ProductViewController {
    func set(categoryName: String) {
        list = Menu().list[categoryName] ?? []
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension ProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ProductCell()
        let name = list[indexPath.row]
        cell.set(imageName: name, title: name, price: "4000")
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ProductViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }
}

// MARK: - UI
extension ProductViewController {
    private func setUI() {
        setBasics()
        setLayouts()
    }
    
    private func setBasics() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 80
        view.addSubview(tableView)
    }
    
    private func setLayouts() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
