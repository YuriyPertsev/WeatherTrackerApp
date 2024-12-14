//
//  HomeScreenViewState.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//

import Foundation

final class HomeScreenViewState: ObservableObject {
    @Published var weather: CityWeather?
    @Published var searchResults: [CityWeather] = []
    @Published var city: String = ""
    @Published var isSearching: Bool = false
    @Published var noResults: Bool = false
}
