//
//  WeatherItemCell.swift
//  WeatherApp
//
//  Created by Przemysław Kuzia on 05.11.2017.
//  Copyright © 2017 pkuzia. All rights reserved.
//

import UIKit
import Kingfisher
import SwifterSwift

class WeatherItemCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var conditionImage: UIImageView!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var dayName: UILabel!
    
    let weatherItemViewModel = WeatherItemViewModel()
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }
    
    // MARK: - Appearance
    
    fileprivate func initUI() {
        selectionStyle = .none
    }
    
    func initCellFromWeatherItem(weatherItem: ForecastWeatherItem) {
        if let iconURL = weatherItem.condition?.icon, let imageUrl = URL(string: weatherItemViewModel.preapreImageURL(url: iconURL)) {
            conditionImage.kf.setImage(with: imageUrl, options: [.transition(.fade(1.0))])
        }
        if let temperatureValue = weatherItem.temperature {
            temperature.attributedText = StyleKit.attributedText(text: weatherItemViewModel.temperatureInFormat(temperature: temperatureValue), attribute: .weatherScreenCellTemperature)
        }
        if let dayValue = weatherItem.date {
            dayName.attributedText = StyleKit.attributedText(text: weatherItemViewModel.dayName(date: dayValue), attribute: .weatherScreenCellDayName)
        }
    }
}
