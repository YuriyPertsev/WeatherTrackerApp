//
//  ScreenFactory.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//

protocol ScreenFactory {
    func makeHomeScreenView(coordinator: AppCoordinator) -> HomeScreenView
}

final class DefaultScreenFactory: ScreenFactory {

    func makeHomeScreenView(coordinator: AppCoordinator) -> HomeScreenView {
        HomeScreenConfigurator().configure(appCoordinator: coordinator)
    }
}
