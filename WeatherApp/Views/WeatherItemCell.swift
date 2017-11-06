//
//  WeatherItemCell.swift
//  WeatherApp
//
//  Created by Przemysław Kuzia on 05.11.2017.
//  Copyright © 2017 pkuzia. All rights reserved.
//

import UIKit

class WeatherItemCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var conditionImage: UIImageView!
    @IBOutlet weak var temperature: UILabel!
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Appearance
}
