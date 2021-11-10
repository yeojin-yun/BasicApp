//
//  SecondViewController.swift
//  ViewChange
//
//  Created by 순진이 on 2021/10/27.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    
    let bluBtn = UIButton()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        bluBtn.setTitle("", for: .normal)
        bluBtn.backgroundColor = .white
        bluBtn.layer.cornerRadius = 10
        view.addSubview(bluBtn)
        bluBtn.addTarget(self, action: #selector(blueBackBtn), for: .touchUpInside)
        
        
        bluBtn.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.safeAreaLayoutGuide
        
        bluBtn.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        bluBtn.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
        bluBtn.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 160).isActive = true
        bluBtn.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -160).isActive = true

        
        
        
    }
    
    @objc func blueBackBtn(_ button: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
