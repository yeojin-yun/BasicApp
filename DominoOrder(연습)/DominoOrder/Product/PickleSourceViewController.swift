//
//  PickleSourceViewController.swift
//  DominoOrder
//
//  Created by 순진이 on 2021/11/24.
//

import UIKit

class PickleSourceViewController: UIViewController {

    
    let pickleSource: [Product] = [
        Product(productTitle: "핫소스", productImg: UIImage(named: "핫소스.jpg")!, productSubText: "500원"),
        Product(productTitle: "우리 피클 M", productImg: UIImage(named: "우리 피클 M.jpg")!, productSubText: "800원"),
        Product(productTitle: "우리 피클 L", productImg: UIImage(named: "우리 피클 L.jpg")!, productSubText: "1,000원"),
        Product(productTitle: "스위트 칠리소스", productImg: UIImage(named: "스위트 칠리소스.jpg")!, productSubText: "1,000원"),
        Product(productTitle: "갈릭 디핑 소스", productImg: UIImage(named: "갈릭 디핑 소스.jpg")!, productSubText: "2,000원")
    ]
    
    let productTable: UITableView = {
        let productTable = UITableView()
        productTable.rowHeight = 120
        return productTable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "음료"
        setBasics()
        setLayout()
    }
    
}



extension PickleSourceViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pickleSource.count
        //switch문 사용안되는지?
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTable.dequeueReusableCell(withIdentifier: ProductTableViewCell.cellID, for: indexPath) as! ProductTableViewCell
        cell.productImg.image = pickleSource[indexPath.row].productImg
        cell.productTitle.text = pickleSource[indexPath.row].productTitle
        //커스텀셀에서 subtitle설정 방법 알아보기
        cell.productSubText.text = pickleSource[indexPath.row].productSubText
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
}


//MARK: -UI
extension PickleSourceViewController {
    
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
