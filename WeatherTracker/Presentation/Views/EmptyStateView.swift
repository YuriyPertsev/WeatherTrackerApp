//
//  EmptyStateView.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//

import SwiftUI

struct EmptyStateView: View {

    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 10) {
                Text("No City Selected")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)

                Text("Please Search For A City")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            .multilineTextAlignment(.center)
            .padding()

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}
