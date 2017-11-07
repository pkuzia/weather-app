//
//  ConditionItem.swift
//  WeatherApp
//
//  Created by Przemysław Kuzia on 11/5/17
//  Copyright (c) 2017 pkuzia. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

public class ConditionItem: BaseModel {
    
    var conditionText: String?
    var icon: String?
    
    override public func mapping(map: Map) {
        icon <- map["icon"]
        conditionText <- map["text"]
    }
}
