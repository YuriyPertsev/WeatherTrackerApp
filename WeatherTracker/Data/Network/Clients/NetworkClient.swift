//
//  NetworkClient.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//

import Foundation
import Combine
import SwiftUI

final class NetworkClient: NetworkClientProtocol {

    private let logManager: NetworkLogManagerProtocol

    init(logManager: NetworkLogManagerProtocol = NetworkLogManager()) {
        self.logManager = logManager
    }

    func get<T>(type: T.Type,
                url: URL
    ) -> AnyPublisher<T, NetworkError> where T : Decodable {

        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue

        return URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .tryMap({ (data, response) in
                    return try self.handleResponse(data: data, response: response, request: request)
            })
            .mapError { $0 as? NetworkError ?? .invalidResponse }
            .eraseToAnyPublisher()
    }

    // Separate method to handle the data and response
    private func handleResponse<T: Decodable>(data: Data, response: URLResponse, request: URLRequest) throws -> T {
        self.logManager.log(request: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        // Error handling based on status code
        var error: NetworkError? = nil
        switch httpResponse.statusCode {
        case 200...299:
            break
        default:
            error = self.parseError(data: data, statusCode: httpResponse.statusCode)
            break
        }

        // If there's an error, throw it and log it
        if let error = error {
            self.logManager.log(error: error)
            throw error
        }

        // Log successful response
        self.logManager.log(responseData: data, response: httpResponse)

        // Decode the data to the expected type
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }

    func parseError(data: Data, statusCode: Int) -> NetworkError {
        var error = NetworkError.notFound
        switch statusCode {
        case 404:
            error = NetworkError.notFound
        case 400...499:
            if let errorJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                if let message = errorJSON.values.first as? [String] {
                    error = NetworkError.encodingError(message.first)
                }
                if let errorValue = errorJSON.first?.value as? [String: Any],
                   let errorDict = errorValue["error"] as? [String: Any] {
                    error = NetworkError.encodingError(errorDict["message"] as? String)
                }
            } else {
                error = NetworkError.invalidResponse
            }
        case 500:
            error = NetworkError.internalServerError
        default:
            error = NetworkError.unknownError(statusCode: statusCode)
        }
        return error
    }

}
