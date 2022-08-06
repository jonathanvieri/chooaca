//
//  WeatherManager.swift
//  Chooaca
//
//  Created by Jonathan Vieri on 22/07/22.
//

import Foundation
import CoreLocation

class WeatherManager : NSObject {
    
    //MARK: - Variables
    
    private let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=\(K.api_key)"
    
    private let locationManager = CLLocationManager()
    
    private var completionHandler: ((WeatherModel) -> Void)?

    
    //MARK: - Methods
    
    public override init() {
        super.init()
        locationManager.delegate = self
    }
    

    public func getWeatherData(_ completionHandler: @escaping((WeatherModel) -> Void) ) {
        self.completionHandler = completionHandler
        locationManager.requestWhenInUseAuthorization() // Request location permission to the user
        locationManager.startUpdatingLocation() // Get current user location
    }
    
    private func fetchWeatherData(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            // Error checking
            guard error == nil else { return }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            
            guard let data = data else { return }
            
            // If there are no errors
            do {
                let decoder = JSONDecoder()

                let decodedData = try decoder.decode(WeatherData.self, from: data)
                
                DispatchQueue.main.async {
                    self.completionHandler?(WeatherModel(weatherData: decodedData))
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}

//MARK: - Extensions

extension WeatherManager : CLLocationManagerDelegate {
    
    // If the user's location is updated
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        fetchWeatherData(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error updating user's location \(error)")
    }
}
