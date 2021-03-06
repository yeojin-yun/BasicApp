//
//  ViewController.swift
//  AlertTest2
//
//  Created by 순진이 on 2021/11/08.
//

import UIKit

class ViewController: UIViewController {
    let walletLbl = UILabel()
    let totalPrice = UILabel()
    
    let menuLbl = UILabel()
    let priceLbl = UILabel()
    let numberLbl = UILabel()
    
    let menu1Lbl = UILabel()
    let menu2Lbl = UILabel()
    let menu3Lbl = UILabel()
    
    let price1 = UILabel()
    let price2 = UILabel()
    let price3 = UILabel()
    
    let num1Lbl = UILabel()
    let num2Lbl = UILabel()
    let num3Lbl = UILabel()
    
    var endTotalLbl = UILabel()
    var resetBtn = UIButton()
    var buyBtn = UIButton()
    
    var firstStepper = UIStepper()
    var secondStepper = UIStepper()
    var thirdsSepper = UIStepper()
    
    let numberFormatter = NumberFormatter()
    
    var firstMenu = 0
    var secondMenu = 0
    var thirdMenu = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBasics()
        setLayout()
        addTarget()
    }
}

extension ViewController {
    func addTarget() {
        resetBtn.addTarget(self, action: #selector(resetBtnTapped(_:)), for: .touchUpInside)
        buyBtn.addTarget(self, action: #selector(buyBtnTapped(_:)), for: .touchUpInside)
        firstStepper.addTarget(self, action: #selector(firstStepperTapped(_:)), for: .touchUpInside)
        secondStepper.addTarget(self, action: #selector(secondStepperTapped(_:)), for: .touchUpInside)
        thirdsSepper.addTarget(self, action: #selector(thirdStepperTapped(_:)), for: .touchUpInside)
    }
    
    
    @objc func firstStepperTapped(_ sender: UIStepper) {
        let stepperNum = Int(sender.value)
        
        num1Lbl.text = stepperNum.description + "개"
        firstMenu = stepperNum * 1500
        
        let firstTotal = firstMenu + secondMenu + thirdMenu
        
        
        //let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        
        if let safeTotal = numberFormatter.string(for: firstTotal) {
            endTotalLbl.text =  safeTotal + "원"
        }
    }
    
    @objc func secondStepperTapped(_ sender: UIStepper) {
        let stepperNum = Int(sender.value)
        num2Lbl.text = stepperNum.description + "개"
        secondMenu = stepperNum * 1000
        let secondTotal = firstMenu + secondMenu + thirdMenu
        numberFormatter.numberStyle = .decimal
        if let safeTotal = numberFormatter.string(for: secondTotal) {
            endTotalLbl.text =  safeTotal + "원"
        }
        
        
    }
    
    @objc func thirdStepperTapped(_ sender: UIStepper) {
        let stepperNum = Int(sender.value)
        num3Lbl.text = stepperNum.description + "개"
        thirdMenu = stepperNum * 1200
        let thirdTotal = firstMenu + secondMenu + thirdMenu
        numberFormatter.numberStyle = .decimal
        if let safeTotal = numberFormatter.string(for: thirdTotal) {
            endTotalLbl.text = safeTotal + "원"
        }
        
    }
    
    @objc func resetBtnTapped(_ sender: UIButton) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let alert = UIAlertController(title: "내 지갑", message: "남은 돈은?", preferredStyle: .alert)
        alert.addTextField { $0.placeholder = "가진 돈 입력하기" }
        let okAction = UIAlertAction(title: "입력", style: .default) { [weak self] (textField) in
            if let fieldList = alert.textFields {
                if let textField = fieldList.first {
                    if let safeData = textField.text {
                        if let safeData2 = Int(safeData) {
                            let safeNum = numberFormatter.string(for: safeData2)
                            self?.totalPrice.text = safeNum! + "원"
                        }
                        
                    }
                }
            }
            //let price = Int(textField.text)
            //let test = numberFormatter.string(for: price)
            //self!.totalPrice.text = test! + "원"
            
            
            [self?.num1Lbl, self?.num2Lbl, self?.num3Lbl].forEach {
                $0!.text = "0개"
            }
            self?.endTotalLbl.text = "0원"
            
            
            self?.firstMenu = 0
            self?.secondMenu = 0
            self?.thirdMenu = 0
            
            
            self?.firstStepper.value = 0
            self?.secondStepper.value = 0
            self?.thirdsSepper.value = 0
            
            
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    @objc func buyBtnTapped(_ sender: UIButton) {
        
        //        let endend = firstMenu + secondMenu + thirdMenu
        //        if let changedInt = Int(endTotalLbl.description) {
        //            if changedInt > endend {
        //                let alert = UIAlertController(title: "구매불가", message: "지갑에 돈이 부족합니다.", preferredStyle: .alert)
        //                let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        //                alert.addAction(okAction)
        //                present(alert, animated: true, completion: nil)
        //                print(changedInt)
        //
        //            } else {
        let alert = UIAlertController(title: "정말 구매하시겠습니까?", message: "구매금액은 \(firstMenu + secondMenu + thirdMenu)입니다.", preferredStyle: .alert)
        let cancleAction = UIAlertAction(title: "취소", style: .cancel) { [weak self] (alert) in
            
            
            //self?.totalPrice.text = "0원"
            //self?.num1Lbl.text = "0개"
            //self?.num2Lbl.text = "0개"
            //self?.num3Lbl.text = "0개"
            //self?.endTotalLbl.text = "0원"
            [self?.totalPrice, self?.endTotalLbl].forEach {
                $0!.text = "0원"
            }
            
            [self?.num1Lbl, self?.num2Lbl, self?.num3Lbl].forEach {
                $0!.text = "0개"
            }
            
            self?.firstMenu = 0
            self?.secondMenu = 0
            self?.thirdMenu = 0
            
            self?.firstStepper.value = 0
            self?.secondStepper.value = 0
            self?.thirdsSepper.value = 0
            
            
        }
        let okAction = UIAlertAction(title: "확인", style: .default) { [weak self] (alert) in
            //self?.totalPrice.text = "0원"
            //self?.num1Lbl.text = "0개"
            //self?.num2Lbl.text = "0개"
            //self?.num3Lbl.text = "0개"
            //self?.endTotalLbl.text = "0원"
            [self?.totalPrice, self?.endTotalLbl].forEach {
                $0!.text = "0원"
            }
            
            [self?.num1Lbl, self?.num2Lbl, self?.num3Lbl].forEach {
                $0!.text = "0개"
            }
            
            self?.firstMenu = 0
            self?.secondMenu = 0
            self?.thirdMenu = 0
            
            self?.firstStepper.value = 0
            self?.secondStepper.value = 0
            self?.thirdsSepper.value = 0
        }
        alert.addAction(cancleAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

//MARK: -UI
extension ViewController {
    
    final private func setBasics() {
        walletLbl.text = "내 지갑: "
        totalPrice.text = "0원"
        menuLbl.text = "종류"
        priceLbl.text = "가격"
        numberLbl.text = "수량"
        menu1Lbl.text = "오징어"
        menu2Lbl.text = "꾸잉칩"
        menu3Lbl.text = "오란다"
        price1.text = "1,500"
        price2.text = "1,000"
        price3.text = "1,200"
        num1Lbl.text = "0개"
        num2Lbl.text = "0개"
        num3Lbl.text = "0개"
        endTotalLbl.text = "0원"
        
        resetBtn.setTitle("초기화", for: .normal)
        resetBtn.backgroundColor = .yellow
        resetBtn.setTitleColor(.blue, for: .normal)
        
        
        buyBtn.setTitle("구매하기", for: .normal)
        buyBtn.backgroundColor = .blue
        buyBtn.setTitleColor(.yellow, for: .normal)
        
        
        [walletLbl, totalPrice, menuLbl, priceLbl, numberLbl, menu1Lbl, menu2Lbl, menu3Lbl, price1, price2, price3, num1Lbl, num2Lbl, num3Lbl, endTotalLbl, resetBtn, buyBtn, firstStepper, secondStepper, thirdsSepper].forEach {
            view.addSubview($0)
        }
        
    }
    final private func setLayout() {
        [menuLbl, priceLbl, numberLbl, menu1Lbl, menu2Lbl, menu3Lbl, price1, price2, price3, numberLbl, num1Lbl, num2Lbl, num3Lbl, endTotalLbl].forEach {
            $0.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [walletLbl, totalPrice, endTotalLbl].forEach {
            $0.font = UIFont.boldSystemFont(ofSize: 30)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [resetBtn, buyBtn].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        }
        
        [firstStepper, secondStepper, thirdsSepper].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            walletLbl.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 50),
            walletLbl.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 100),
            totalPrice.leadingAnchor.constraint(equalTo: walletLbl.leadingAnchor, constant: 100),
            totalPrice.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 100),
            
            menuLbl.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 50),
            menuLbl.topAnchor.constraint(equalTo: walletLbl.topAnchor, constant: 100),
            priceLbl.leadingAnchor.constraint(equalTo: menuLbl.leadingAnchor, constant: 80),
            priceLbl.topAnchor.constraint(equalTo: walletLbl.topAnchor, constant: 100),
            numberLbl.leadingAnchor.constraint(equalTo: priceLbl.leadingAnchor, constant: 80),
            numberLbl.topAnchor.constraint(equalTo: walletLbl.topAnchor, constant: 100),
            
            menu1Lbl.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 50),
            menu1Lbl.topAnchor.constraint(equalTo: menuLbl.topAnchor, constant: 50),
            price1.leadingAnchor.constraint(equalTo: menu1Lbl.leadingAnchor, constant: 80),
            price1.topAnchor.constraint(equalTo: menuLbl.topAnchor, constant: 50),
            num1Lbl.leadingAnchor.constraint(equalTo: price1.leadingAnchor, constant: 80),
            num1Lbl.topAnchor.constraint(equalTo: menuLbl.topAnchor, constant: 50),
            
            firstStepper.leadingAnchor.constraint(equalTo: num1Lbl.leadingAnchor, constant: 50),
            firstStepper.topAnchor.constraint(equalTo: menuLbl.topAnchor, constant: 50),
            
            menu2Lbl.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 50),
            menu2Lbl.topAnchor.constraint(equalTo: menu1Lbl.topAnchor, constant: 50),
            price2.leadingAnchor.constraint(equalTo: menu2Lbl.leadingAnchor, constant: 80),
            price2.topAnchor.constraint(equalTo: menu1Lbl.topAnchor, constant: 50),
            num2Lbl.leadingAnchor.constraint(equalTo: price2.leadingAnchor, constant: 80),
            num2Lbl.topAnchor.constraint(equalTo: menu1Lbl.topAnchor, constant: 50),
            
            secondStepper.leadingAnchor.constraint(equalTo: num2Lbl.leadingAnchor, constant: 50),
            secondStepper.topAnchor.constraint(equalTo: menu1Lbl.topAnchor, constant: 50),
            
            menu3Lbl.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 50),
            menu3Lbl.topAnchor.constraint(equalTo: menu2Lbl.topAnchor, constant: 50),
            price3.leadingAnchor.constraint(equalTo: menu3Lbl.leadingAnchor, constant: 80),
            price3.topAnchor.constraint(equalTo: menu2Lbl.topAnchor, constant: 50),
            num3Lbl.leadingAnchor.constraint(equalTo: price3.leadingAnchor, constant: 80),
            num3Lbl.topAnchor.constraint(equalTo: menu2Lbl.topAnchor, constant: 50),
            
            thirdsSepper.leadingAnchor.constraint(equalTo: num3Lbl.leadingAnchor, constant: 50),
            thirdsSepper.topAnchor.constraint(equalTo: menu2Lbl.topAnchor, constant: 50),
            
            endTotalLbl.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 200),
            endTotalLbl.topAnchor.constraint(equalTo: menu3Lbl.topAnchor, constant: 50),
            
            resetBtn.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 50),
            resetBtn.topAnchor.constraint(equalTo: endTotalLbl.topAnchor, constant: 50),
            //resetBtn.trailingAnchor.constraint(equalTo: buyBtn.leadingAnchor, constant: -50),
            
            buyBtn.leadingAnchor.constraint(equalTo: resetBtn.trailingAnchor, constant: 30),
            buyBtn.topAnchor.constraint(equalTo: endTotalLbl.topAnchor, constant: 50),
            buyBtn.widthAnchor.constraint(equalTo: resetBtn.widthAnchor),
            buyBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50)
        ])
        
    }
}

