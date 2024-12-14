//
//  AppCoordinator.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//
import SwiftUI

final class AppCoordinator: ObservableObject {
    @Published private var navigationPath = NavigationPath()
    private let screenFactory: ScreenFactory

    init(screenFactory: ScreenFactory) {
        self.screenFactory = screenFactory
    }

    func start() -> some View {
        setupNavigationStack()
    }

    private func makeHomeView() -> some View {
        screenFactory.makeHomeScreenView(coordinator: self)
    }

    private func setupNavigationStack() -> some View {
        NavigationStack(path: Binding(
            get: { self.navigationPath },
            set: { self.navigationPath = $0 }
        )) {
            makeHomeView()
        }
    }
}
