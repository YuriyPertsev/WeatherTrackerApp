//
//  HomeScreenOutput.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//

import Foundation

protocol HomeScreenOutput: AnyObject {
    func fetchWeatherData(for city: String)
}
