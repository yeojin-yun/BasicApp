//
//  ViewController.swift
//  URLSession-Starter
//
//  Created by 순진이 on 2021/12/27.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let tempLbl = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        getWeather()
    }


}

extension ViewController {
    private func getWeather() {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=seoul&appid=cc67530774268e4f6e4250794df2dca2") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else { return print(error!) }
            //에러가 없는 경우
            
            guard let response = response as? HTTPURLResponse,
                  (200..<400).contains(response.statusCode) else { return print("Invalid Response") }
            
            
            guard let data = data else { return }
            
            let jsonDecoder = JSONDecoder()
            let decodeData = try jsonDecoder.decode(WeatherData.self, from: data)
            let temp = decodeData.main.temp
            
            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                    if let main = jsonObject["main"] as? [String: Double] {
                        let temp = main["temp"]!
                        DispatchQueue.main.async {
                            self.tempLbl.text = String(temp)
                        }
                    }
                }
            } catch {
                print("Parshing Error")
                print(error)
            }
        }.resume()
    // 에러 : 있을수도 있고, 없을수도 있기 때문에 옵셔널 형태
    // 데이터 : 에러가 없을 때 데이터가 있음
    // 레스폰즈 : 결과
    }
}



//MARK: -UI
extension ViewController {
    final private func configureUI() {
        setAttributes()
        setConstraints()
    }
    final private func setAttributes() {
        tempLbl.text = "32.5"
    }
    final private func setConstraints() {
        view.addSubview(tempLbl)
        tempLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tempLbl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            tempLbl.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
}

