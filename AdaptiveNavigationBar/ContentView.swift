//
//  ContentView.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 31/10/2023.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        Screen {
            ForEach(0..<20) { _ in
                Color.random
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
