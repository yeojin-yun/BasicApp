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
        
        //        let alamo = AF.request(url, method: .get, parameters: [:], encoding: URLEncoding.default, headers: ["Content-Type":"application/json", "Accept":"application/json"]).validate(statusCode: 200..<300)
        AF.request(url).validate(statusCode: 200..<300).responseDecodable(of: WeatherManager.self) { (response) in
            guard let safeResponse = response.value else { return }
            
            let temp = safeResponse.main.temp
            DispatchQueue.main.async {
                self.mainLbl.text = String(temp)
            }

        }
        
        
        //        { response in
        //            switch response.result {
        //            case .success(let jsonData):
        //                do {
        //                    let jsondecoder = JSONDecoder()
        //                    let decodedData = try jsondecoder.decode(WeatherManager.self, from: jsonData)
        //                    let temp = decodedData.mainLbl
        //
        //                } catch {
        //
        //                }
        //            case .failure(let error):
        //                print(error)
        //            }
        //        }
        
        //        Alamofire.request("https://api.github.com/users", method: .get, parameters: [:], encoding: URLEncoding.default, headers: ["Content-Type":"application/json", "Accept":"application/json"])
        //                    .validate(statusCode: 200..<300)
        //                    .responseJSON { (response) in
        //                    if let JSON = response.result.value
        //                    {
        //                        print(JSON)
        //                    }
        //                }
        
        
        
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
        myButton.addTarget(self, action: #selector(getTempTapped(_:)), for: .touchUpInside)
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
