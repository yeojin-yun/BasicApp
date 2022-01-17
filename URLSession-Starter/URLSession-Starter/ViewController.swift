//
//  ViewController.swift
//  URLSession-Starter
//
//  Created by 순진이 on 2021/12/27.
//

import UIKit


class ViewController: UIViewController {

    let tempLbl = UILabel()
    let feelsLikeLbl = UILabel()
    let idLbl = UILabel()
    let mainLbl = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        getWeather()
    }


}

extension ViewController {
    private func getWeather() {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=4999a8c6b45fbd5bb0de1b72f2690fef&q=seoul&units=metric") else { return }
        
        let urlSession = URLSession.shared
        
        let task = urlSession.dataTask(with: url) { data, response, error in
            //에러 여부 체크
            guard error == nil else { return print(error!) }
            
            //응답 코드 확인
            guard let response = response as? HTTPURLResponse,
                  (200..<400).contains(response.statusCode) else { return print("Invalid Response") }
            
            //데이터 확인
            guard let data = data else { return }
            do {
                let jsonDecoder = JSONDecoder()
                let decodeData = try jsonDecoder.decode(WeatherData.self, from: data)
                let temp = decodeData.main.temp
                let feelsLike = decodeData.main.feelsLike
                let id = decodeData.weather[0].id
                let main = decodeData.weather[0].main
                DispatchQueue.main.async {
                    self.tempLbl.text = "temp: \(String(temp))"
                    self.tempLbl.backgroundColor = .lightGray
                    self.feelsLikeLbl.text = "feels_like: \(String(feelsLike))"
                    self.feelsLikeLbl.backgroundColor = .lightGray
                    self.idLbl.text = "id: \(String(id))"
                    self.idLbl.backgroundColor = .lightGray
                    self.mainLbl.text = "main: \(String(main))"
                    self.mainLbl.backgroundColor = .lightGray
                }
            } catch {
                print("Parshing Error")
                print(error)
            }
        }
            
        task.resume()
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
        tempLbl.text = "temp"
        feelsLikeLbl.text = "feels_Like"
        idLbl.text = "id"
        mainLbl.text = "main"
        
    }
    final private func setConstraints() {
        [tempLbl, feelsLikeLbl, idLbl, mainLbl].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            tempLbl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            tempLbl.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            feelsLikeLbl.topAnchor.constraint(equalTo: tempLbl.bottomAnchor, constant: 15),
            feelsLikeLbl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),

            idLbl.topAnchor.constraint(equalTo: feelsLikeLbl.bottomAnchor, constant: 15),
            idLbl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),

            mainLbl.topAnchor.constraint(equalTo: idLbl.bottomAnchor, constant: 15),
            mainLbl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
}

