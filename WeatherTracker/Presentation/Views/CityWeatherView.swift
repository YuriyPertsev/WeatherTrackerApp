//
//  CityWeatherView.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//

import SwiftUI

struct CityWeatherView: View {
    private var weather: CityWeather

    init(weather: CityWeather) {
        self.weather = weather
    }

    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                Spacer()
                ZStack {
                    AsyncImage(url: URL(string: "https:" + weather.icon)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView() // Show a loading spinner
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                            case .failure:
                                Image(systemName: "cloud") // Show a placeholder image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.gray)
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .font(.system(size: 100))
                        .foregroundColor(.yellow)
                }

                VStack(spacing: 5) {
                    HStack {
                        Text(weather.condition)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)

                        Image("Vector")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 21, height: 21)
                    }
                    HStack {
                        Text("\(weather.temperature)")
                            .font(.system(size: 70))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Image("Ellipse")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 8, height: 8)
                            .offset(x: 0, y: -25)
                    }
                }

                // MARK: Weather Details
                HStack(spacing: 60) {
                    WeatherDetailView(title: "Humidity", value: "\(weather.humidity)%")
                    WeatherDetailView(title: "UV", value: "\(weather.uv)")
                    WeatherDetailView(title: "Feels Like", value: "\(weather.feelsLike)°")
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                .padding(.horizontal, 30)

                Spacer()
                Spacer()
            }
        }
    }
}
