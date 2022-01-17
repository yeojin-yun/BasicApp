//
//  WeatherData.swift
//  URLSession-Starter
//
//  Created by 순진이 on 2022/01/10.
//

import Foundation

struct WeatherData: Decodable {
    let main: Main
    let weather: [Weather]
    
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
    
    struct Weather: Decodable {
        let id: Int
        let main, weatherDescription, icon: String
        
        enum CodingKeys: String, CodingKey {
            case id, main
            case weatherDescription = "description"
            case icon
        }
    }
}
