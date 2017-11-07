//
//  WeatherItemCell.swift
//  WeatherApp
//
//  Created by Przemysław Kuzia on 05.11.2017.
//  Copyright © 2017 pkuzia. All rights reserved.
//

import UIKit
import Kingfisher

class WeatherItemCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var conditionImage: UIImageView!
    @IBOutlet weak var temperature: UILabel!
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Appearance
    
    func initCellFromWeatherItem(weatherItem: ForecastWeatherItem) {
        if let icon = weatherItem.condition?.icon, let imageUrl = URL(string: icon) {
            conditionImage.kf.indicatorType = .activity
            conditionImage.kf.setImage(with: imageUrl, options: [.transition(.fade(0.2))])
        }
        if let temperatureValue = weatherItem.temperature {
            temperature.attributedText = StyleKit.attributedText(text: String(temperatureValue), attribute: .weatherScreenTopViewTemperature)
        }
    }
}
