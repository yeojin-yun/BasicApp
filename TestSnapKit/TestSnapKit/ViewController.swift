//
//  ViewController.swift
//  TestSnapKit
//
//  Created by 순진이 on 2022/01/19.
//

import UIKit
import SnapKit
import Alamofire

class ViewController: UIViewController {
    
    let mainLbl = UILabel()
    let myButton = UIButton()
    let imgView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        view.backgroundColor = .white
        
    }
    
    
    
}

//MARK: -Event
extension ViewController{
    @objc func getTempTapped(_ sender: UIButton) {
        let url = "https://api.openweathermap.org/data/2.5/weather?appid=cc67530774268e4f6e4250794df2dca2&units=metric&q=seoul"
        
        
        
        AF.request(url).validate(statusCode: 200..<300).responseDecodable(of: WeatherManager.self) { (response) in
            guard let safeResponse = response.value else { return }
            
            let temp = safeResponse.main.temp
            DispatchQueue.main.async {
                self.mainLbl.text = String(temp)
            }
        }
    }
    
    @objc func didTapped(_ sender: UIButton) {
        let request = AF.request("https://api.openweathermap.org/data/2.5/weather?appid=cc67530774268e4f6e4250794df2dca2&units=metric&q=seoul")
        request.validate().responseDecodable(of: WeatherManager.self) { response in
            switch response.result {
            case .success(let weather):
                self.mainLbl.text = String(weather.main.temp)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc func btnTapped(_ sender: UIButton) {
        
        let request = AF.request("https://api.openweathermap.org/data/2.5/weather?appid=cc67530774268e4f6e4250794df2dca2&units=metric&q=seoul")//, method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["Content-Type":"application/json", "Accept":"application/json"], interceptor: nil, requestModifier: nil)
        
        request.validate(statusCode: 200..<300).responseData { response in
            
            switch response.result {
            case .success(let weather):
                print(weather)
            case .failure(let error):
                print(error)
            }
        }
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
        mainLbl.textColor = UIColor.darkGray
        mainLbl.layer.borderWidth = 1
        mainLbl.layer.cornerRadius = 10
        mainLbl.textAlignment = .center
        myButton.setTitle("Get Temperature", for: .normal)
        myButton.setTitleColor(.blue, for: .normal)
        imgView.image = UIImage(named: "cool-background")
        
    }
    final private func addTarget() {
        myButton.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
    }
    
    final private func setConstraints() {
        [imgView, mainLbl, myButton].forEach {
            view.addSubview($0)
        }
        imgView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
        
        mainLbl.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(120)
            $0.height.equalTo(40)
        }
        
        myButton.snp.makeConstraints {
            $0.top.equalTo(mainLbl.snp.bottom).offset(120)
            $0.centerX.equalToSuperview()
        }
    }
}


class MyView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
