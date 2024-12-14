//
//  UserDefaultsRepository.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//
import Foundation
import Combine

class UserDefaultsRepository {
    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }

    func choosedCity() -> String? {
        userDefaults.findValue(
            forKey: UserDefaultsKeys.City.choosedCity
        )
    }

    func setChoosedCity(_ city: String) {
        userDefaults.set(
            city,
            forKey: UserDefaultsKeys.City.choosedCity
        )
    }
}
