//
//  WeatherDetailView.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//

import SwiftUI

struct WeatherDetailView: View {
    let title: String
    let value: String

    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.system(size: 12))
                .foregroundColor(Color(red: 196/255, green: 196/255, blue: 196/255))
            Text(value)
                .font(.system(size: 15))
                .fontWeight(.bold)
                .foregroundColor(Color(red: 154/255, green: 154/255, blue: 154/255))
        }
    }
}
