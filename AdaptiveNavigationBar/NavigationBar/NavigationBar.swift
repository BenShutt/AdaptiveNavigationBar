//
//  NavigationBar.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 31/10/2023.
//

import SwiftUI

/// A view used as a custom top safe area for navigation bar UI
struct NavigationBar: View {

    /// Critical scroll offset in Y for the different states
    private let maxOffsetY: CGFloat = 50

    /// The content offset in Y of the scroll view
    var offsetY: CGFloat

    /// Value in `[0, 1]` from not scrolled to fully scrolled
    private var progress: CGFloat {
        max(0, min(maxOffsetY, offsetY)) / maxOffsetY
    }

    var body: some View {
        ZStack(alignment: .top) {
            LargeNavigationBar(vPadding: .vPadding * (1 - progress))
                .offset(y: -10 * progress)
                .opacity(max(0, CGFloat(1) - 2 * progress))

            SmallNavigationBar()
                .opacity(max(0, 2 * progress - CGFloat(1)))
        }
        .background {
            NavigationBarBackground()
                .ignoresSafeArea(edges: .top)
        }
    }
}

// MARK: - View + Extensions

extension View {

    func navigationBar(offsetY: CGFloat) -> some View {
        modifier(StickyTop {
            NavigationBar(offsetY: offsetY)
        })
    }
}

// MARK: - Preview

#Preview {
    Color.white.navigationBar(offsetY: 0)
}
