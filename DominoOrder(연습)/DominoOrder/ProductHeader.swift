//
//  ProductHeader.swift
//  DominoOrder
//
//  Created by 순진이 on 2021/11/23.
//

import UIKit

class ProductHeader: UITableViewHeaderFooterView {

    
    let image = UIImageView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        image.translatesAutoresizingMaskIntoConstraints = false
//        title.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(image)
//        contentView.addSubview(title)
        
        NSLayoutConstraint.activate([
//            image.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            image.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 150),
            image.heightAnchor.constraint(equalToConstant: 150),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            

        ])

        
    }
    
}
