//
//  HomeScreenConfigurator.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//

import Foundation

final class HomeScreenConfigurator {
    func configure(appCoordinator: AppCoordinator) -> HomeScreenView {

        let viewState = HomeScreenViewState()
        let weatherService = WeatherService(weatherNetworkClient: WeatherNetworkClient(networkClient: NetworkClient()),
                                            imageService: ImageService())

        let viewModel = HomeScreenViewModel(
            appCoordinator: appCoordinator,
            viewState: viewState,
            weatherService: weatherService,
            userDefaults: UserDefaultsRepository(userDefaults: UserDefaults.standard)
        )

        return HomeScreenView(viewState: viewState, output: viewModel)
    }
}
