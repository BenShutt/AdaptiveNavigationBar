//
//  StickyTop.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 31/10/2023.
//

import SwiftUI

/// Using `VStack` in place of `safeAreaInset(edge: .top)` since the
/// safe area causes glitches/lag while scrolling.
struct StickyTop<Top: View>: ViewModifier {

    @ViewBuilder var top: () -> Top

    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            top()
            content
        }
    }
}
