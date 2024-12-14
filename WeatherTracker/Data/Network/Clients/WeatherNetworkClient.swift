//
//  WeatherNetworkClient.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//

import Foundation
import Combine

final class WeatherNetworkClient: WeatherNetworkClientProtocol {

    let networkClient: NetworkClientProtocol

    init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
    }

    func fetchCurrentWeather(for city: String) -> AnyPublisher<Weather, NetworkError> {
        var endpoint = Endpoint.weather

        let queryParams = [
            "key": Constants.weatherApiKey,
            "q": city
        ]

        endpoint.queryItems = queryParams.map { key, value in
           URLQueryItem(name: key, value: value)
        }

        return networkClient.get(type: Weather.self,
                                 url: endpoint.url)
    }
}

