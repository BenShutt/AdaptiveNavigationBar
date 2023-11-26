//
//  Color+Extensions.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 31/10/2023.
//

import SwiftUI

// MARK: - Color + Extensions

extension Color {

    /// Get a random color
    static var random: Color {
        Color(red: .random, green: .random, blue: .random)
    }
}

// MARK: - Double + Extensions

private extension Double {

    /// Get a random real number in `[0, 1]`
    static var random: Double {
        .random(in: 0...1)
    }
}
