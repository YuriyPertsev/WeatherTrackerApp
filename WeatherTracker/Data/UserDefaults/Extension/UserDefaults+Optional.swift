//
//  UserDefaults+Optional.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//

import Foundation

extension UserDefaults {
    func findValue<T>(forKey key: String) -> T? {
        self.value(forKey: key) as? T
    }
}
