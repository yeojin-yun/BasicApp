//
//  WeatherData.swift
//  URLSession-Starter
//
//  Created by 순진이 on 2022/01/10.
//

import Foundation

struct WeatherData: Decodable {
    let main: Double
    
    struct Main: Decodable {
        let temp: Double
        let feelslike: Double
    }
}
