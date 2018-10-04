//
//  WeatherForecast.swift
//  Weather City List
//
//  Created by Vadym Sushko on 9/27/18.
//  Copyright © 2018 Vadym Sushko. All rights reserved.
//

import Foundation

struct WeatherForecast: Decodable {
    var cod: String?
    var list: [List]?
    var city: City?
}
struct List: Decodable {
    var main: Main?
    var weather: [Weather]?
    var clouds: Clouds?
    var wind: Wind?
}
struct Main: Decodable {
    var temp: Double?
    var temp_min: Double?
    var temp_max: Double?
    var humidity: Int?
}
struct Weather: Decodable {
    var main: String?
    var description: String?
    var icon: String?
}
struct Clouds: Decodable {
    var all: Int?
}
struct Wind: Decodable {
    var speed: Double?
    var deg: Double?
}

