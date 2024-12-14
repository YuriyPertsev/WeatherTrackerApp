//
//  WeatherResponse.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//

import Foundation

struct Location: Codable {
    let name: String
}

struct Condition: Codable {
    let icon: String
    let text: String
}

struct CurrentWeather: Codable {
    let tempF: Double
    let condition: Condition
    let humidity: Double
    let uv: Double
    let feelslikeF: Double

    enum CodingKeys: String, CodingKey {
        case tempF = "temp_f"
        case feelslikeF = "feelslike_f"
        case humidity
        case uv
        case condition
    }
}

struct Weather: Codable {
    let current: CurrentWeather
    let location: Location
}
