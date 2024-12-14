//
//  WeatherNetworkClientProtocol.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//

import Foundation
import Combine

protocol WeatherNetworkClientProtocol: AnyObject {
    var networkClient: NetworkClientProtocol { get }

    func fetchCurrentWeather(for city: String) -> AnyPublisher<Weather, NetworkError>
}
