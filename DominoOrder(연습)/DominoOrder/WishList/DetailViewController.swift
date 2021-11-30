//
//  DetailViewController.swift
//  DominoOrder
//
//  Created by 순진이 on 2021/11/23.
//

import UIKit

class DetailViewController: UIViewController {

    static let imageView = UIImageView()
    let quantity = UILabel()
    let upBtn = UIButton()
    let downBtn = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setBasics()
        setLayout()
    }
    

}

extension DetailViewController {
    func setBasics() {
        
        quantity.text = "0개"
        quantity.textColor = .white
        quantity.backgroundColor = .gray
        quantity.font = UIFont.boldSystemFont(ofSize: 25)
        quantity.textAlignment = .center
        
        
        upBtn.setTitle("+", for: .normal)
        upBtn.setTitleColor(.gray, for: .normal)
        upBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        upBtn.layer.borderWidth = 2
        upBtn.layer.borderColor = UIColor.gray.cgColor
        
        
        downBtn.setTitle("-", for: .normal)
        downBtn.setTitleColor(.gray, for: .normal)
        downBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        downBtn.layer.borderWidth = 2
        downBtn.layer.borderColor = UIColor.gray.cgColor
        
    }
    func setLayout() {
        
        let stack = UIStackView(arrangedSubviews: [downBtn, quantity, upBtn])
        stack.axis = .horizontal
        stack.spacing = 1
        
        
        view.addSubview(stack)
        view.addSubview(DetailViewController.imageView)
        
        [DetailViewController.imageView, stack].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([

            DetailViewController.imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            DetailViewController.imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            DetailViewController.imageView.topAnchor.constraint(equalTo: (view.safeAreaLayoutGuide.topAnchor), constant: 70),
            DetailViewController.imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150),
            
            stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            stack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            quantity.widthAnchor.constraint(equalToConstant: 150),
            upBtn.widthAnchor.constraint(equalToConstant: 40),
            downBtn.widthAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    

    
}


