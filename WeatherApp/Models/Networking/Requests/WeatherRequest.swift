//
//  WeatherRequest.swift
//  WeatherApp
//
//  Created by Przemysław Kuzia on 14.09.2017.
//  Copyright (c) 2017 pkuzia. All rights reserved.
//

import Foundation

public class WeatherRequest: BaseRequestModel {
    
    var name: String
    var key: String
    var days: Int
    
    init(name: String, key: String, days: Int = 7) {
        self.name = name
        self.key = key
        self.days = days
    }

    fileprivate func getParametersBody() -> [String: Any]? {
        return nil
    }
    
    fileprivate func getParametersQuery() -> [String: Any]? {
        var parameters = [String: Any]()
        parameters["q"] = name
        parameters["key"] = key
        parameters["days"] = days
        return parameters
    }
    
    public func getParameters() -> [String: Any]? {
        var parameters: [String: Any] = [:]
        parameters[queryName] = getParametersQuery()
        parameters[bodyName] = getParametersBody()
        return parameters
    }
}
