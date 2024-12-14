//
//  NoResultsView.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//

import SwiftUI

struct NoResultsView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("No Results Found")
                .font(.title)
                .fontWeight(.bold)
            Text("Try searching for another city.")
                .foregroundColor(.gray)
                .padding(.top, 4)
            Spacer()
        }
        .padding()
    }
}
