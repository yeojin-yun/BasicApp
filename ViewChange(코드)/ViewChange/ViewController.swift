//
//  ViewController.swift
//  ViewChange
//
//  Created by 순진이 on 2021/10/27.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    
    
    let redButton = UIButton()
    let blueButton = UIButton()
    let greenButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redButton.frame.size = CGSize(width: 100, height: 70)
        redButton.setTitle("", for: .normal)
        redButton.backgroundColor = .red
        redButton.layer.cornerRadius = 10
        view.addSubview(redButton)
        redButton.addTarget(self, action: #selector(redBtnTapped(_:)), for: .touchUpInside)
        
        //blueButton.frame.size = CGSize(width: 60, height: 30)
        blueButton.setTitle("", for: .normal)
        blueButton.backgroundColor = .blue
        blueButton.layer.cornerRadius = 10
        view.addSubview(blueButton)
        blueButton.addTarget(self, action: #selector(blueBtnTapped), for: .touchUpInside)
        
        //greenButton.frame.size = CGSize(width: 60, height: 30)
        greenButton.setTitle("", for: .normal)
        greenButton.backgroundColor = .green
        greenButton.layer.cornerRadius = 10
        view.addSubview(greenButton)
        greenButton.addTarget(self, action: #selector(greenBtnTapped), for: .touchUpInside)
        
        redButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        greenButton.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        redButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        greenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        redButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 300).isActive = true
        blueButton.topAnchor.constraint(equalTo: redButton.topAnchor, constant: 80).isActive = true
        greenButton.topAnchor.constraint(equalTo: blueButton.topAnchor, constant: 80).isActive = true
        
        redButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 160).isActive = true
        blueButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 160).isActive = true
        greenButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 160).isActive = true
        
        redButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -160).isActive = true
        blueButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -160).isActive = true
        greenButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -160).isActive = true
    }
    
    @objc func redBtnTapped(_ button: UIButton) {
        let rootVC = FirstViewController()
        
        //guard let rootVC = storyboard?.instantiateViewController(identifier: "FirstVC") else { return }
        rootVC.modalPresentationStyle = .fullScreen
        self.present(rootVC, animated: true)
    }
    
    @objc func blueBtnTapped(_ button: UIButton) {
        let secondVC = SecondViewController()
        
        //guard let secondVC = storyboard?.instantiateViewController(identifier: "SecondVC") else { return }
        secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC, animated: true)
        
    }
    
    @objc func greenBtnTapped(_ button: UIButton) {
        let thirdVC = ThirdViewController()
        
//        guard let thirdVC = storyboard?.instantiateViewController(identifier: "ThirdVC") else { return }
        
        thirdVC.modalPresentationStyle = .fullScreen
        self.present(thirdVC, animated: true)
        
    }
    
    
}
