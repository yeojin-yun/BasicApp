//
//  WishListViewController.swift
//  DominoOrder
//
//  Created by 순진이 on 2021/11/22.
//

import UIKit

class WishListViewController: UIViewController {

    static var wishDictionary: [String:Int] = [:]
    var keysDictionary: [String] = []
    var valuesDictionary: [Int] = []
    
    let wishTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 120
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        self.navigationItem.title = "WishList"
        //(동일)self.navigationController?.navigationBar.topItem?.title = "Domino's"
        self.navigationController?.navigationBar.barTintColor = .white
        view.backgroundColor = .white
        wishTableView.delegate = self
        wishTableView.dataSource = self
        wishTableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.cellID)
        //setDict()
        setTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setDict()
        print(DetailViewController.wishDictionary)
        //print(keysDictionary)
        //print(valuesDictionary)
        
        //wishTableView.reloadData()
    }
}

extension WishListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return WishListViewController.wishDictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = wishTableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.cellID, for: indexPath) as! ProductTableViewCell
        //cell.productImg.image = UIImage(named: keysDictionary[indexPath.row])
        
        cell.productTitle.text = String(keysDictionary[indexPath.row])
        cell.productSubText.text = "주문수량: \(String(valuesDictionary[indexPath.row]))개"
        return cell
        

    }
    
    func setTable() {
        view.addSubview(wishTableView)
        wishTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wishTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            wishTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            wishTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            wishTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setDict() {
        for dict in DetailViewController.wishDictionary.keys {
            keysDictionary.append(dict)
        }
        for dict in DetailViewController.wishDictionary.values {
            valuesDictionary.append(dict)
        }
    }
}
