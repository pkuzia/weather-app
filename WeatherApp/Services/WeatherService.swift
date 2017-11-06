//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Przemysław Kuzia on 11/5/17
//  Copyright (c) 2017 pkuzia. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: Networking

class WeatherService: BaseService {
    
    func weatherForecast(weatherRequest: WeatherRequest, completionHandler: @escaping (FetchResult, WeatherResponse?) -> ()) {
        
        weatherProvider.request(.weather(weatherRequest), completion: { result in
            self.handleMoyaResultWithMappingObject(result: result, completionHandler: completionHandler)
        })
    }
}
