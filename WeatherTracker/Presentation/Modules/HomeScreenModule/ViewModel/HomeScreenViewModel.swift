//
//  HomeScreenViewModel.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//

import Foundation
import Combine

final class HomeScreenViewModel {
    private let appCoordinator: AppCoordinator
    private let viewState: HomeScreenViewState
    private let weatherService: WeatherService
    private let userDefaults: UserDefaultsRepository
    private var cancellables: Set<AnyCancellable> = []

    init(
        appCoordinator: AppCoordinator,
        viewState: HomeScreenViewState,
        weatherService: WeatherService,
        userDefaults: UserDefaultsRepository
    ) {
        self.viewState = viewState
        self.appCoordinator = appCoordinator
        self.weatherService = weatherService
        self.userDefaults = userDefaults
        if let choosedCity = userDefaults.choosedCity(), !choosedCity.isEmpty {
            fetchWeather(for: choosedCity)
        }
    }

    func fetchWeather(for city: String) {
        weatherService.fetchCurrentWeather(for: city)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.viewState.isSearching = false
                case .failure(_):
                    self?.clearSerchResults()
                }
            } receiveValue: {[weak self] weather in
                self?.viewState.noResults = false
                let weather = CityWeatherMapper.map(from: weather)
                self?.viewState.weather = weather
                if let self, self.viewState.isSearching {
                    self.viewState.searchResults.append(weather)
                }
            }
            .store(in: &self.cancellables)
    }

    func clearSerchResults() {
        self.viewState.weather = nil
        self.viewState.noResults = true
        self.viewState.searchResults.removeAll()
    }

}

// MARK: - HomeScreenOutput

extension HomeScreenViewModel: HomeScreenOutput {
    func fetchWeatherData(for city: String) {
        viewState.isSearching = true
        viewState.noResults = false
        userDefaults.setChoosedCity(city)
        if !city.isEmpty {
            fetchWeather(for: city)
        } else {
            clearSerchResults()
        }
    }
}
