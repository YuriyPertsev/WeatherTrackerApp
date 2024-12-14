//
//  NetworkClientProtocol.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//

import Foundation
import Combine

protocol NetworkClientProtocol: AnyObject {

    func get<T>(type: T.Type,
                url: URL
    ) -> AnyPublisher<T, NetworkError> where T: Decodable
}
