//
//  WeatherEndpoint.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//
import Foundation

extension Endpoint {
    static var weather: Self {
        return Endpoint(path: "/v1/current.json")
    }
}
