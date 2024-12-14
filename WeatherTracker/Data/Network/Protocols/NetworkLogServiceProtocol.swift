//
//  NetworkLogServiceProtocol.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//
import Foundation

protocol NetworkLogManagerProtocol {
    func log(request: URLRequest)
    func log(responseData data: Data?, response: URLResponse?)
    func log(error: Error)
}

