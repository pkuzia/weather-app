//
//  WeatherItemViewModel.swift
//  WeatherApp
//
//  Created by Przemysław Kuzia on 08.11.2017.
//  Copyright © 2017 pkuzia. All rights reserved.
//

import UIKit

protocol WeatherItemViewModelDelegate: class {
    
}

class WeatherItemViewModel: BaseViewModel {
    
    // MARK: - Strings
    
    // MARK: - View Model Data
    
    weak var delegate: WeatherItemViewModelDelegate?
    
    // MARK: - Functions
}


