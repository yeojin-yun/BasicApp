//
//  ProductViewController.swift
//  DominoOrder
//
//  Created by 순진이 on 2021/11/22.
//

import UIKit

class ProductViewController: UIViewController {
    
    let product: [Product] = [
        Product(productTitle: "포테이토", productImg: UIImage(named: "포테이토.jpg")!),
        Product(productTitle: "불고기", productImg: UIImage(named: "불고기.jpg")!),
        Product(productTitle: "페퍼로니", productImg: UIImage(named: "페퍼로니.jpg")!),
        Product(productTitle: "베이컨체더치즈", productImg: UIImage(named: "베이컨체더치즈.jpg")!),
        Product(productTitle: "슈퍼슈프림", productImg: UIImage(named: "슈퍼슈프림.jpg")!),
        Product(productTitle: "슈퍼디럭스", productImg: UIImage(named: "슈퍼디럭스.jpg")!)
    ]
    
    let productTable: UITableView = {
        let productTable = UITableView()
        productTable.rowHeight = 120
        return productTable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setBasics()
        setLayout()
    }
    
}

   

extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTable.dequeueReusableCell(withIdentifier: ProductTableViewCell.cellID, for: indexPath) as! ProductTableViewCell
        cell.productImg.image = product[indexPath.row].productImg
        cell.productTitle.text = product[indexPath.row].productTitle
        
        return cell
    }

}
    

//MARK: -UI
extension ProductViewController {

    final private func setBasics() {
        view.addSubview(productTable)
        productTable.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.cellID)
        productTable.delegate = self
        productTable.dataSource = self
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

