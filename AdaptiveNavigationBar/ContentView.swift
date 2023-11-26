//
//  ContentView.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 31/10/2023.
//

import SwiftUI

struct ContentView: View {

    @State private var colors = (0..<20).map { index in
        (index: index, color: Color.random)
    }

    var body: some View {
        Screen {
            ForEach(colors, id: \.index) { _, color in
                color
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .padding()
            }
        }
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}
