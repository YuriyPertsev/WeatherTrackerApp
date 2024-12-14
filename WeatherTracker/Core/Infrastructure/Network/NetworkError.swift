//
//  NetworkError.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//
import Foundation

enum NetworkError: Error {
    case error(statusCode: Int, data: Data?)
    case urlGeneration
    /// The request was rejected: 400-499
    case requestFailed(Error)
    /// The server response was invalid (unexpected format).
    case invalidResponse
    case dataNotFound
    /// There was an error parsing the data.
    case decodingFailed(Error)
    /// Encoding issue when trying to send data.
    case encodingFailed(Error)
    case encodingError(String?)
    case operationFailed(Error)
    case notFound
    /// Encountered a server error.
    case internalServerError
    /// There was an error during validation the data.
    case validationError(String?)
    /// Unknown error.
    case unknownError(statusCode: Int)
    case notConnected
    case cancelled
}
