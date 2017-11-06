//
//  WeatherScreenViewController.swift
//  WeatherApp
//
//  Created by Przemysław Kuzia on 05.11.2017.
//Copyright © 2017 pkuzia. All rights reserved.
//

import UIKit

class WeatherScreenViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var topScreen: UIView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var currentConditionImage: UIImageView!
    @IBOutlet weak var currentTemperature: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let weatherScreenViewModel = WeatherScreenViewModel()
    
    // MARK: - View Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    // MARK: - Appearance
    
    func initUI() {
        weatherScreenViewModel.fetchWeatherForecast { result in
            
        }
    }
    
    // MARK: - User Interaction
    
    // MARK: - Additional Helpers
    
}

// MARK: - WeatherScreenViewModelDelegate

extension WeatherScreenViewController: WeatherScreenViewModelDelegate {
    
}

