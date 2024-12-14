//
//  CityWeather.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//

import SwiftUI

struct CityWeather: Identifiable {
    let id = UUID()
    let name: String
    let condition: String
    let temperature: Int
    let humidity: Int
    let uv: Int
    let feelsLike: Int
    let icon: String
}
