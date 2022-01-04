//
//  DetailViewController.swift
//  DominoStudy
//
//  Created by 순진이 on 2022/01/04.
//

import UIKit

class DetailViewController: UIViewController {

    private let imageView = UIImageView()
    private let subtractButton = UIButton()
    private let addButton = UIButton()
    private let quantityLabel = UILabel()
    
    private var quantity = 0 {
        willSet {
            quantityLabel.text = "\(newValue)개"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    


}

extension DetailViewController {
    @objc func didTapped(_ sender: UIButton) {
        switch sender {
        case subtractButton:
            guard quantity > 0 else { return }
                quantity -= 1
            OrderManager.shared.removeItem(itemName: "불고기")
        case addButton:
            quantity += 1
            OrderManager.shared.addItem(itemName: "불고기")
        default:
            break
        }
    }
}

//MARK: -UI
extension DetailViewController {
    final private func configureUI() {
        setAttributes()
        setConstraints()
    }
    final private func setAttributes() {
        [imageView, subtractButton, addButton, quantityLabel].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "불고기")
        subtractButton.setTitle("-", for: .normal)
        subtractButton.setTitleColor(.black, for: .normal)
        addButton.setTitle("+", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        quantityLabel.text = "0개"
        
        subtractButton.addTarget(self, action: #selector(didTapped(_:)), for: .touchUpInside)
        addButton.addTarget(self, action: #selector(didTapped(_:)), for: .touchUpInside)
    }
    final private func setConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            quantityLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            quantityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 40),
            quantityLabel.widthAnchor.constraint(equalToConstant: 40),
            quantityLabel.heightAnchor.constraint(equalToConstant: 38),
            
            subtractButton.widthAnchor.constraint(equalToConstant: 20),
            subtractButton.trailingAnchor.constraint(equalTo: quantityLabel.leadingAnchor),
            subtractButton.bottomAnchor.constraint(equalTo: quantityLabel.bottomAnchor),
            subtractButton.topAnchor.constraint(equalTo: quantityLabel.topAnchor),
            
            addButton.widthAnchor.constraint(equalToConstant: 20),
            addButton.leadingAnchor.constraint(equalTo: quantityLabel.trailingAnchor),
            addButton.bottomAnchor.constraint(equalTo: quantityLabel.bottomAnchor),
            addButton.topAnchor.constraint(equalTo: quantityLabel.topAnchor),
            
        ])
    }
}

