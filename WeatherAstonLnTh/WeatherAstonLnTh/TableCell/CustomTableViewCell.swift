//
//  CustomTableViewCell.swift
//  WeatherAstonLnTh
//
//  Created by Калякин Дима  on 15.12.2023.
//

import Foundation
import UIKit


class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var tempMinLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var tempMaxLabel: UILabel!
    
    
    override var reuseIdentifier:String? {
        return "CustomTableViewCell"
    }
    
    
    
    
}
