//
//  FirstViewController.swift
//  ViewChange
//
//  Created by 순진이 on 2021/10/27.
//

import UIKit

class FirstViewController: UIViewController {

    
    let redBtn = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        redBtn.setTitle("", for: .normal)
        redBtn.backgroundColor = .white
        redBtn.layer.cornerRadius = 10
        view.addSubview(redBtn)
        redBtn.addTarget(self, action: #selector(redBackBtn), for: .touchUpInside)
        
        
        redBtn.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.safeAreaLayoutGuide
        
        redBtn.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        redBtn.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
        redBtn.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 160).isActive = true
        redBtn.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -160).isActive = true
        
        
        // Do any additional setup after loading the view.
    }
    

    @objc func redBackBtn(_ button: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

}
