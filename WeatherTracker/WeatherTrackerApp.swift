//
//  WeatherTrackerApp.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//

import SwiftUI

@main
struct WeatherTrackerApp: App {
    @StateObject private var coordinator = AppCoordinator(
        screenFactory: DefaultScreenFactory()
    )

    var body: some Scene {
        WindowGroup {
            coordinator.start()
        }
    }
}
