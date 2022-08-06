//
//  WeatherModel.swift
//  Chooaca
//
//  Created by Jonathan Vieri on 20/07/22.
//

import Foundation

struct WeatherModel {
    
    //MARK: - Variables
    
    let cityName: String
    let description: String
    let conditionID: Int
    let temperature: Double
    let minTemp: Double
    let maxTemp: Double
    
    var conditionName: String {
        switch conditionID {
        case 200...232:
            return "cloud.bolt.rain.fill"
        case 300...321:
            return "cloud.rain.fill"
        case 500...531:
            return "cloud.heavyrain.fill"
        case 600...622:
            return "cloud.snow.fill"
        case 721:
            return "sun.haze.fill"
        case 800:
            return "sun.max.fill"
        case 801...804:
            return "cloud.fill"
        default:
            return "questionmark"
        }
    }
    
    //MARK: - Methods
    
    init(weatherData: WeatherData) {
        conditionID = weatherData.weather.first?.id ?? 0
        cityName = weatherData.name
        description = weatherData.weather.first?.description ?? ""
        temperature = weatherData.main.temp
        minTemp = weatherData.main.temp_min
        maxTemp = weatherData.main.temp_max
    }
    

}
