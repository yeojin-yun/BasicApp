//
//  ProductViewController.swift
//  DominoOrder
//
//  Created by 순진이 on 2021/11/22.
//

import UIKit

class ProductViewController: UIViewController {
    
    let productTable: UITableView = {
        let productTable = UITableView()
        productTable.rowHeight = 150
        return productTable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setBasics()
        setLayout()
    }
    
}
//MARK: -UI
extension ProductViewController {

    final private func setBasics() {
        view.addSubview(productTable)
    }
    final private func setLayout() {
        productTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            productTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            productTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            productTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

