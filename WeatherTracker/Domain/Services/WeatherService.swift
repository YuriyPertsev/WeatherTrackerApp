//
//  WeatherService.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//

import UIKit
import Combine

class WeatherService {

    private let weatherNetworkClient: WeatherNetworkClientProtocol
    private let imageService: ImageServiceProtocol

    init(weatherNetworkClient: WeatherNetworkClientProtocol,
         imageService: ImageServiceProtocol) {
        self.weatherNetworkClient = weatherNetworkClient
        self.imageService = imageService
    }

    func fetchCurrentWeather(for city: String) -> AnyPublisher<Weather, NetworkError> {
        weatherNetworkClient.fetchCurrentWeather(for: city)
    }

    func fetchImage(by link: String?) -> AnyPublisher<UIImage, NetworkError> {
        imageService.fetchImage(by: link)
    }
}
