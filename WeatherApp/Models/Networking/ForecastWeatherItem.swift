//
//  ForecastWeatherItem.swift
//  WeatherApp
//
//  Created by Przemysław Kuzia on 11/5/17
//  Copyright (c) 2017 pkuzia. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

public class ForecastWeatherItem: BaseModel {
    
    var date: String?
    var temperature: Float?
    var condition: ConditionItem?

    override public func mapping(map: Map) {
        date <- map["date"]
        temperature <- map["day.avgtemp_c"]
        condition <- map["day.condition"]
    }
}
