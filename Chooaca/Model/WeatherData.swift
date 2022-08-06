//
//  WeatherData.swift
//  Chooaca
//
//  Created by Jonathan Vieri on 18/07/22.
//

import Foundation

struct WeatherData : Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main : Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct Weather : Decodable {
    let id: Int
    let description: String
}
