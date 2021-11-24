//
//  DetailViewController.swift
//  DominoOrder
//
//  Created by 순진이 on 2021/11/23.
//

import UIKit

class DetailViewController: UIViewController {

    let imageView = UIImageView()
    let quantity = UILabel()
    let upBtn = UIButton()
    let downBtn = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.tabBarItem.title = "선택한 상품 이름"
    }
    

}

extension DetailViewController {
    func setBasics() {
        [imageView, quantity, upBtn, downBtn].forEach {
            view.addSubview($0)
        }
//        imageView.image = UIImage(named: <#T##String#>)
        quantity.text = "0개"
        upBtn.setTitle("+", for: .normal)
        downBtn.setTitle("-", for: .normal)
        
    }
    func setLayout() {
        [imageView, quantity, upBtn, downBtn].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: (self.navigationController?.navigationBar.bottomAnchor)!, constant: 30),
            
            
            
        ])
    }
}
