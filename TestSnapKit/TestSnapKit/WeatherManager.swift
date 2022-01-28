//
//  WeatherManager.swift
//  TestSnapKit
//
//  Created by 순진이 on 2022/01/19.
//

import Foundation

struct WeatherManager: Decodable {
    let main: Main
    
    struct Main: Decodable {
        let temp, feelsLike, tempMin, tempMax: Double
        let pressure, humidity: Int
        
        
        enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike = "feels_like"
            case tempMin = "temp_min"
            case tempMax = "temp_max"
            case pressure, humidity
        }
    }
}

