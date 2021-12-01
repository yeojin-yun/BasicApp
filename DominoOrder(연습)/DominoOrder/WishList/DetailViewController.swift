//
//  DetailViewController.swift
//  DominoOrder
//
//  Created by 순진이 on 2021/11/23.
//

import UIKit

protocol wishlistProtocol: class {
    var image: UIImageView { get set }
    var title: UILabel { get set }
    var quantity: UILabel { get set }
}

class DetailViewController: UIViewController {
   
    

    static let imageView = UIImageView()
    let quantityLbl = UILabel()
    let upBtn = UIButton()
    let downBtn = UIButton()
    var totalQuantity = 0
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(rightButtonTapped(_:)))
        setBasics()
        setLayout()
    }
    

}

extension DetailViewController {
    @objc func upBtnTapped(_ sender: UIButton) {
        totalQuantity += 1
        quantityLbl.text = String(totalQuantity) + "개"
        
    }
    
    @objc func downBtnTapped(_ sender: UIButton) {
        if totalQuantity > 0 {
        totalQuantity -= 1
        quantityLbl.text = String(totalQuantity) + "개"
        }
    }
    
    @objc func rightButtonTapped(_ sender: UIBarButtonItem) {
        //wishlistController에 담기도록
        //현재 imageView에 올라온 사진 -> wishlist컨트롤러에 테이블뷰셀에
        //현재 title에 설정된 이름 -> Wishlist컨트롤러에 테이블뷰셀에
        //현재 quantityLbl의 수량 -> wishlist컨트롤러에 테이블뷰셀에
        
    }
    
    func setBasics() {
        
        quantityLbl.text = "0개"
        quantityLbl.textColor = .white
        quantityLbl.backgroundColor = .gray
        quantityLbl.font = UIFont.boldSystemFont(ofSize: 25)
        quantityLbl.textAlignment = .center
        
        
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
        
        
        upBtn.addTarget(self, action: #selector(upBtnTapped(_:)), for: .touchUpInside)
        downBtn.addTarget(self, action: #selector(downBtnTapped(_:)), for: .touchUpInside)
    }
    func setLayout() {
        
        let stack = UIStackView(arrangedSubviews: [downBtn, quantityLbl, upBtn])
        stack.axis = .horizontal
        stack.spacing = 0
        
        
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
            
            quantityLbl.widthAnchor.constraint(equalToConstant: 150),
            upBtn.widthAnchor.constraint(equalToConstant: 40),
            downBtn.widthAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    

    
}


