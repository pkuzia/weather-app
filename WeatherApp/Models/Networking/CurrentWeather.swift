//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Przemysław Kuzia on 11/5/17
//  Copyright (c) 2017 pkuzia. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

public class CurrentWeather: BaseModel {
    
    var condition: ConditionItem?
    var temperature: Float?
    
    override public func mapping(map: Map) {
        condition <- map["condition"]
        temperature <- map["temp_c"]
    }
}
