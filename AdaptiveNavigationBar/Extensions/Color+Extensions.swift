//
//  Color+Extensions.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 31/10/2023.
//

import SwiftUI

// MARK: - Color + Extensions

extension Color {

    static var random: Color {
        Color(red: .random, green: .random, blue: .random)
    }
}

// MARK: - Double + Extensions

private extension Double {

    static var random: Double {
        .random(in: 0...1)
    }
}
