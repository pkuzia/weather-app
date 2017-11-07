//
//  WeatherScreenViewModel.swift
//  WeatherApp
//
//  Created by Przemysław Kuzia on 05.11.2017.
//Copyright © 2017 pkuzia. All rights reserved.
//

import UIKit

protocol WeatherScreenViewModelDelegate: class {
    
}

class WeatherScreenViewModel: BaseViewModel {
    
    // MARK: - Strings
    
    // MARK: - View Model Data
    
    let weatherService = WeatherService()
    let cellID = "WeatherCell"
    
    weak var delegate: WeatherScreenViewModelDelegate?
    
    var weatherResponse: WeatherResponse?
    
    // MARK: - Functions
    
    func fetchWeatherForecast(completionHandler: @escaping (FetchResult) -> ()) {
        
        let weatherRequest = WeatherRequest(name: "Warsaw", key: "44aaab399caa452aaa194352170511", days: 7)
        
        weatherService.weatherForecast(weatherRequest: weatherRequest) { result, weatherResponse in
            DispatchQueue.main.async {
                if result.error != nil {
                    completionHandler(result)
                } else {
                    if let weatherResponse = weatherResponse {
                        self.weatherResponse = weatherResponse
                        completionHandler(FetchResult(error: nil))
                    } else {
                        completionHandler(FetchResult(error: .unknownError))
                    }
                }
            }
        }
    }
}


