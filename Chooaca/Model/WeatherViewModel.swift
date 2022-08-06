//
//  WeatherViewModel.swift
//  Chooaca
//
//  Created by Jonathan Vieri on 22/07/22.
//

import Foundation

final class WeatherViewModel : ObservableObject {
    
    //MARK: - Variables
    @Published var cityName: String = ""
    @Published var temperature: String = ""
    @Published var minTemp: String = ""
    @Published var maxTemp: String = ""
    @Published var description: String = ""
    @Published var conditionName: String = "questionmark"
    
    private let weatherManager: WeatherManager
    
    init(weatherManager: WeatherManager) {
        self.weatherManager = weatherManager
    }
    
    func refreshData() {
        weatherManager.getWeatherData { weather in
            DispatchQueue.main.async {
                self.cityName = weather.cityName
                self.temperature = String(format: "%.0f", weather.temperature)
                self.minTemp = String(format: "%.0f", weather.minTemp)
                self.maxTemp = String(format: "%.0f", weather.maxTemp)
                self.description = weather.description
                self.conditionName = weather.conditionName

            }
        }
    }
}
