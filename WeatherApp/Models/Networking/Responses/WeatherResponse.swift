//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Przemysław Kuzia on 11/5/17
//  Copyright (c) 2017 pkuzia. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

public class WeatherResponse: BaseModel {
    
    var location: LocationWeather?
    var currentWeather: CurrentWeather?
    var forecastWeather: [ForecastWeatherItem]?

    override public func mapping(map: Map) {
        location <- map["location"]
        currentWeather <- map["current"]
        forecastWeather <- map["forecast.forecastday"]
    }
}
