//
//  ThirdViewController.swift
//  ViewChange
//
//  Created by 순진이 on 2021/10/27.
//

import UIKit

class ThirdViewController: UIViewController {
    
    let greenBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        greenBtn.setTitle("", for: .normal)
        greenBtn.backgroundColor = .white
        greenBtn.layer.cornerRadius = 10
        view.addSubview(greenBtn)
        greenBtn.addTarget(self, action: #selector(greenBackBtn), for: .touchUpInside)
        
        
        greenBtn.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.safeAreaLayoutGuide
        
        greenBtn.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        greenBtn.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
        greenBtn.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 160).isActive = true
        greenBtn.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -160).isActive = true

    }
    

    @objc func greenBackBtn(_ button: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

}
