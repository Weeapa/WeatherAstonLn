//
//  OfferMiodel.swift
//  WeatherAstonLnTh
//
//  Created by Калякин Дима  on 15.12.2023.
//

import Foundation


class OfferModel:Codable {
    var cod: String?
    var message: Float?
    var cnt: Float?
    var list: [ListOfferModel]?
}
