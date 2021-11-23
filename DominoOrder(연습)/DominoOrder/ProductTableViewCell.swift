//
//  ProductTableViewCell.swift
//  DominoOrder
//
//  Created by 순진이 on 2021/11/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    static let cellID = "CellId"
    
    let productTitle = UILabel()
    let productImg = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.addSubview(productTitle)
        self.addSubview(productImg)
        productTitle.translatesAutoresizingMaskIntoConstraints = false
        productImg.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productImg.leadingAnchor.constraint(equalTo:self.leadingAnchor),
            productImg.widthAnchor.constraint(equalToConstant: 120),
            productImg.heightAnchor.constraint(equalToConstant: 120),
            productImg.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            
            productTitle.leadingAnchor.constraint(equalTo:productImg.trailingAnchor, constant: 15),
            productTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            productTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            
        ])
        
        productTitle.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
