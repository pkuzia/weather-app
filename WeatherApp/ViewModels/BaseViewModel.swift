//
//  BaseViewModel.swift
//  WeatherApp
//
//  Created by Przemysław Kuzia on 11/5/17
//  Copyright (c) 2017 pkuzia. All rights reserved.
//

import UIKit

class BaseViewModel {
    
    // MARK: - Functions
    
    func preapreImageURL(url: String) -> String{
        return url.replace(target: "//", withString: "http://")
    }
    
    func temperatureInFormat(temperature: Float) -> String {
        return String(temperature) + " °C"
    }
    
    func dayName(date: String) -> String {
        let dateFormatter = DateFormatter()
        let dayNameDateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: date)
        
        dayNameDateFormatter.dateFormat = "EEEE"
        if let date = date {
            return dayNameDateFormatter.string(from: date)
        } else {
            return ""
        }
    }
}
