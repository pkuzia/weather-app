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
        initTableView()
        initTopView()
        fetchData()
    }
    
    // MARK: - User Interaction
    
    // MARK: - Additional Helpers
    
    fileprivate func initTopView() {
        if let cityNameText = weatherScreenViewModel.weatherResponse?.location?.name {
            cityName.attributedText = StyleKit.attributedText(text: cityNameText, attribute: .weatherScreenTopViewCityName)
        }
    }
    
    fileprivate func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    fileprivate func fetchData() {
        weatherScreenViewModel.fetchWeatherForecast { result in
            if result.error == nil {
                self.refereshWeatherScreen()
            }
        }
    }
    
    fileprivate func refereshWeatherScreen() {
        self.initTopView()
        self.tableView.reloadData()
    }
}

// MARK: - WeatherScreenViewModelDelegate

extension WeatherScreenViewController: WeatherScreenViewModelDelegate {
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension WeatherScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let forecastWeather = weatherScreenViewModel.weatherResponse?.forecastWeather else {
            return 0
        }
        return forecastWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let weatherItemCell = tableView.dequeueReusableCell(withIdentifier: weatherScreenViewModel.cellID) as? WeatherItemCell else {
            return UITableViewCell()
        }
        if let forecastWeatherItem = weatherScreenViewModel.weatherResponse?.forecastWeather?.item(at: indexPath.row) {
            weatherItemCell.initCellFromWeatherItem(weatherItem: forecastWeatherItem)
        }
        return weatherItemCell
    }
}
