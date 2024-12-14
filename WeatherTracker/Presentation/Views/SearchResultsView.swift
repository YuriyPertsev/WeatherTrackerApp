//
//  SearchResultsView.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//

import SwiftUI

struct SearchResultsView: View {
    let results: [CityWeather]
    let onSelect: (CityWeather) -> Void

    var body: some View {
        List(results) { weather in
            Button(action: { onSelect(weather) }) {
                HStack {
                    VStack(alignment: .center, spacing: 0) {
                        Text(weather.name)
                            .font(.system(size: 30))

                        HStack(spacing: 5) {
                            Text("\(weather.temperature)")
                                .font(.system(size: 60))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Image("Ellipse")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 8, height: 8)
                                .offset(x: 0, y: -20)
                        }
                    }
                    .foregroundColor(.black)
                    Spacer()
                    AsyncImage(url: URL(string: "https:" + weather.icon)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 83, height: 67)
                            case .failure:
                                Image(systemName: "cloud")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 83, height: 67)
                                    .foregroundColor(.gray)
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .font(.system(size: 100))
                }
            }
            .listRowBackground(Color.gray.opacity(0.1))
        }
        .scrollContentBackground(.hidden)
        .background(.white)
    }
}
