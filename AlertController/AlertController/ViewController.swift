//
//  ViewController.swift
//  AlertController
//
//  Created by 순진이 on 2021/11/11.
//

import UIKit

class ViewController: UIViewController {

    var mainLbl = UILabel()
    
    var idLbl = UILabel()
    var passwordLbl = UILabel()
    
    var userId = UILabel()
    var userPassword = UILabel()
    
    var inputButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //초기 레이블 값 설정
        mainLbl.text = "아이디와 비밀번호를 입력하세요."
        idLbl.text = "ID : "
        passwordLbl.text = "PASSWORD: "
        
        //버튼 타이틀, 배경색, 폰트크기 변경
        inputButton.setTitle("입력하기", for: .normal)
        inputButton.backgroundColor = .purple
        inputButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        
        //레이블과 버튼 뷰에 올리기
        view.addSubview(mainLbl)
        view.addSubview(idLbl)
        view.addSubview(passwordLbl)
        view.addSubview(userId)
        view.addSubview(userPassword)
        view.addSubview(inputButton)
        
        //버튼 액션 올리기
        inputButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        setUI()
    }
    
    //각 레이블과 버튼의 오토레이아웃 잡기
    func setUI() {
        [mainLbl, idLbl, passwordLbl, userId, userPassword].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.font = UIFont.boldSystemFont(ofSize: 23) //폰트 볼드체
        }
        
        inputButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            mainLbl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            mainLbl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            mainLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            
            idLbl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            idLbl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            idLbl.topAnchor.constraint(equalTo: mainLbl.bottomAnchor, constant: 50),
            
            
            userId.leadingAnchor.constraint(equalTo: idLbl.leadingAnchor, constant: 50),
            userId.topAnchor.constraint(equalTo: mainLbl.bottomAnchor, constant: 50),
            
            
            passwordLbl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            passwordLbl.topAnchor.constraint(equalTo: idLbl.topAnchor, constant: 50),
            
            
            userPassword.leadingAnchor.constraint(equalTo: passwordLbl.trailingAnchor, constant: 10),
            userPassword.topAnchor.constraint(equalTo: idLbl.topAnchor, constant: 50),
            
            
            inputButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            inputButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            inputButton.topAnchor.constraint(equalTo: userPassword.topAnchor, constant: 50)
        ])
    }
        //버튼에 이벤트 메서드 구현하기
        @objc func buttonTapped(_ sender: UIButton) {
            //alert창 찍어내기
            let alert = UIAlertController(title: "입력하라우", message: "당신의 계정!", preferredStyle: .alert)
            
            //alert창 속 텍스트 필드 추가하기 1 (아이디 필드)
            alert.addTextField { (idField) in
                idField.placeholder = "ID를 입력"
            }
            
            //alert창 속 텍스트 필드 추가하기 2 (비밀번호 필드)
            alert.addTextField { (passwordField) in
                passwordField.placeholder = "비밀번호 입력"
                passwordField.isSecureTextEntry = true
            }
            
            //alert속 액션 구현 1 (확인 버튼)
            let ok = UIAlertAction(title: "확인", style: .default) { ok in
                if let firstText = alert.textFields?[0] {
                    self.userId.text = firstText.text
                    
                }
                if let secondText = alert.textFields?[1] {
                    self.userPassword.text = secondText.text
                }
                
            }
            
            //alert속 액션 구현 2 (취소 버튼)
            let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            
            //alert에 각 액션 더하기
            alert.addAction(ok)
            alert.addAction(cancel)
            
            //alert나타내기
            present(alert, animated: true, completion: nil)
        
    }

}

