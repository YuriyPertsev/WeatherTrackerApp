//
//  HomeScreenView.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//

import SwiftUI

struct HomeScreenView: View {
    @ObservedObject private var viewState: HomeScreenViewState
    private let output: HomeScreenOutput?

    init(
        viewState: HomeScreenViewState,
        output: HomeScreenOutput?
    ) {
        self.viewState = viewState
        self.output = output
    }

    var body: some View {
        VStack {
            // MARK: - Search Bar
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.gray.opacity(0.1))
                .frame(height: 50)
                .overlay(
                    HStack {
                        TextField("Search Location", text: $viewState.city, onCommit: searchWeather)
                            .padding(.horizontal, 10)
                            .frame(height: 46)
                            .cornerRadius(16)

                        Spacer()
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.trailing)
                    }
                )
                .padding(.horizontal)

            if viewState.weather == nil && viewState.searchResults.isEmpty && !viewState.isSearching {
                EmptyStateView()
            } else if !viewState.searchResults.isEmpty {
                SearchResultsView(results: viewState.searchResults) { weather in
                    viewState.weather = weather
                    viewState.searchResults = []
                }
            } else if viewState.weather != nil {
                if let weather = viewState.weather {
                    CityWeatherView(weather: weather)
                }
            } else if viewState.noResults {
                NoResultsView()
            }
            Spacer()
        }
    }

    func searchWeather() {
        output?.fetchWeatherData(for: viewState.city)
    }
}
