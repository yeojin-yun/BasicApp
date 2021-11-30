//
//  ProductViewController.swift
//  DominoOrder
//
//  Created by 순진이 on 2021/11/22.
//

import UIKit

class ProductViewController: UIViewController {
    
    let product: [Product] = [
        Product(productTitle: "포테이토", productImg: UIImage(named: "포테이토.jpg")!, productSubText: "10,000원"),
        Product(productTitle: "불고기", productImg: UIImage(named: "불고기.jpg")!, productSubText: "10,000원"),
        Product(productTitle: "페퍼로니", productImg: UIImage(named: "페퍼로니.jpg")!, productSubText: "10,000원"),
        Product(productTitle: "베이컨체더치즈", productImg: UIImage(named: "베이컨체더치즈.jpg")!, productSubText: "10,000원"),
        Product(productTitle: "슈퍼슈프림", productImg: UIImage(named: "슈퍼슈프림.jpg")!, productSubText: "10,000원"),
        Product(productTitle: "슈퍼디럭스", productImg: UIImage(named: "슈퍼디럭스.jpg")!, productSubText: "10,000원")
    ]
    
//    let product: [Product] = [
//        Product(productTitle: "더블크러스트 이베리코", productImg: UIImage(named: "더블크러스트 이베리코.jpg")!, productSubText: "10,000원"),
//        Product(productTitle: "와규 앤 비스테카", productImg: UIImage(named: "와규 앤 비스테카.jpg")!, productSubText: "10,000원"),
//        Product(productTitle: "블랙타이거 슈림프", productImg: UIImage(named: "블랙타이거 슈림프.jpg")!, productSubText: "10,000원"),
//        Product(productTitle: "블랙앵거스 스테이크", productImg: UIImage(named: "블랙앵거스 스테이크.jpg")!, productSubText: "10,000원"),
//        Product(productTitle: "직화 스테이크", productImg: UIImage(named: "직화 스테이크.jpg")!, productSubText: "10,000원"),
//    ]
    
    let productTable: UITableView = {
        let productTable = UITableView()
        productTable.rowHeight = 120
        return productTable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "클래식 피자"
        setBasics()
        setLayout()
    }
    
}

   

extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product.count
        //switch문 사용안되는지?
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTable.dequeueReusableCell(withIdentifier: ProductTableViewCell.cellID, for: indexPath) as! ProductTableViewCell
//        let cell1 = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
//        cell1.textLabel?.text = "10,000원"
//
        cell.productImg.image = product[indexPath.row].productImg
        cell.productTitle.text = product[indexPath.row].productTitle
        //커스텀셀에서 subtitle설정 방법 알아보기
        cell.productSubText.text = product[indexPath.row].productSubText
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        switch indexPath.row {
        case 0:
            let detail = DetailViewController()
            self.navigationController?.pushViewController(detail, animated: true)
            DetailViewController.imageView.image = UIImage(named: "포테이토.jpg")
            detail.title = "포테이토"
            
        case 1:
            let detail = DetailViewController()
            self.navigationController?.pushViewController(detail, animated: true)
            DetailViewController.imageView.image = UIImage(named: "불고기.jpg")
            detail.title = "불고기"
            
        case 2:
            let detail = DetailViewController()
            self.navigationController?.pushViewController(detail, animated: true)
            DetailViewController.imageView.image = UIImage(named: "페퍼로니.jpg")
            detail.title = "페퍼로니"
            
        case 3:
            let detail = DetailViewController()
            self.navigationController?.pushViewController(detail, animated: true)
            DetailViewController.imageView.image = UIImage(named: "베이컨체더치즈.jpg")
            detail.title = "베이컨체더치즈"
            
        case 4:
            let detail = DetailViewController()
            self.navigationController?.pushViewController(detail, animated: true)
            DetailViewController.imageView.image = UIImage(named: "슈퍼슈프림.jpg")
            detail.title = "슈퍼슈프림"
            
        case 5:
            let detail = DetailViewController()
            self.navigationController?.pushViewController(detail, animated: true)
            DetailViewController.imageView.image = UIImage(named: "슈퍼디럭스.jpg")
            detail.title = "슈퍼디럭스"
            
        default:
            break
        }
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

