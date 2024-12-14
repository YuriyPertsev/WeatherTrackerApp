//
//  CityWeatherMapper.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//

import Foundation

class CityWeatherMapper {

    static func map(from weather: Weather) -> CityWeather {
        CityWeather(name: weather.location.name,
                    condition: weather.current.condition.text,
                    temperature: Int(weather.current.tempF),
                    humidity: Int(weather.current.humidity),
                    uv: Int(weather.current.uv),
                    feelsLike: Int(weather.current.feelslikeF),
                    icon: weather.current.condition.icon)
    }

}
