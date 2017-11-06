//
//  LocationWeather.swift
//  WeatherApp
//
//  Created by Przemysław Kuzia on 11/5/17
//  Copyright (c) 2017 pkuzia. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

public class LocationWeather: BaseModel {
    
    var name: String?
 
    override public func mapping(map: Map) {
        name <- map["name"]
    }
}
