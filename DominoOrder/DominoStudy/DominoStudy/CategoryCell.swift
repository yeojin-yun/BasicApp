//
//  CategoryCell.swift
//  DominoStudy
//
//  Created by 순진이 on 2022/01/04.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    // MARK: -Properties
    static let cellID = "CategoryCell"
    
    private let CategoryimageView = UIImageView()
    
    // MARK: -Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategoryCell {
    //외부에서 셀을 생성하고 이 함수를 호출하며 이미지를 세팅
    func set(imageName: String) {
        CategoryimageView.image = UIImage(named: imageName)
    }
}

// MARK: -UI
extension CategoryCell {
    private func setUI() {
        contentView.addSubview(CategoryimageView)
    }
    
    private func setLayout() {
        CategoryimageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            CategoryimageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            CategoryimageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            CategoryimageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            CategoryimageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}
