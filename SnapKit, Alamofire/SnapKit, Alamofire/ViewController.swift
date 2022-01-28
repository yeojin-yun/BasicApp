//
//  ViewController.swift
//  SnapKit, Alamofire
//
//  Created by 순진이 on 2022/01/18.
//

import UIKit

class ViewController: UIViewController {
    
    let mainLbl = UILabel()
    let myButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        view.backgroundColor = .white
    }


}

//MARK: -UI
extension ViewController {
    final private func configureUI() {
        setAttributes()
        addTarget()
        setConstraints()
    }
    
    final private func setAttributes() {
        mainLbl.text = "No info"
        mainLbl.textColor = UIColor.lightGray
        mainLbl.layer.borderWidth = 1
        mainLbl.layer.cornerRadius = 10
        myButton.setTitle("Get Temperature", for: .normal)
        myButton.setTitleColor(.blue, for: .normal)
    }
    final private func addTarget() {
        
    }
    
    final private func setConstraints() {
        [mainLbl, myButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            mainLbl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            mainLbl.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            myButton.topAnchor.constraint(equalTo: mainLbl.bottomAnchor, constant: 50),
            myButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
}

