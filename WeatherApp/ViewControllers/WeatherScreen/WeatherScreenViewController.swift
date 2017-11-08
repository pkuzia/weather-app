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
    @IBOutlet weak var backgroundImage: UIImageView!
    
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
        initNavBar()
        initTableView()
        initTopView()
        fetchData()
    }
    
    fileprivate func initNavBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.barStyle = .black
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - User Interaction
    
    // MARK: - Additional Helpers
    
    fileprivate func initTopView() {
        if let cityNameText = weatherScreenViewModel.weatherResponse?.location?.name {
            cityName.attributedText = StyleKit.attributedText(text: cityNameText, attribute: .weatherScreenTopViewCityName)
        }
        
        if let iconURL = weatherScreenViewModel.weatherResponse?.currentWeather?.condition?.icon,
            let imageUrl = URL(string: weatherScreenViewModel.preapreImageURL(url: iconURL)) {
            currentConditionImage.contentMode = .scaleAspectFill
            currentConditionImage.kf.setImage(with: imageUrl, options: [.transition(.fade(1.0))])
        }
        
        if let temperature = weatherScreenViewModel.weatherResponse?.currentWeather?.temperature {
            currentTemperature.attributedText = StyleKit.attributedText(text: weatherScreenViewModel.temperatureInFormat(temperature: temperature), attribute: .weatherScreenTopViewTemperature)
        }
        if let image = UIImage(named: weatherScreenViewModel.backgroundName) {
            backgroundImage.image = image
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return weatherScreenViewModel.weatherItemCellHeight
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
