//
//  CustomTableViewCell.swift
//  TabBarController
//
//  Created by 순진이 on 2021/11/18.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let cellId = "CellId"
    
    let menuImg = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        self.addSubview(menuImg)
        
        menuImg.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            menuImg.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            menuImg.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            menuImg.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            menuImg.widthAnchor.constraint(equalTo: self.widthAnchor),
            menuImg.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
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
