//
//  NavigationBar.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 31/10/2023.
//

import SwiftUI

/// A view used as a custom top safe area for navigation bar UI
struct NavigationBar: View {

    /// Furthest the UI adapts for a scroll offset
    private let maxScrollOffset: CGFloat = 50

    /// The content offset in Y of the scroll view
    var scrollOffset: CGFloat

    /// Value in `[0, 1]` from not scrolled to fully scrolled
    private var progress: CGFloat {
        max(0, min(maxScrollOffset, scrollOffset)) / maxScrollOffset
    }

    var body: some View {
        ZStack(alignment: .top) {
            Text("Large Navigation Bar")
                .font(.system(size: 26, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 15 * (1 - progress))
                .opacity(1 - progress)

            Text("Small Navigation Bar")
                .font(.system(size: 18, weight: .semibold))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .opacity(progress)
        }
        .padding(.horizontal, 20)
        .background {
            NavigationBarBackground()
                .ignoresSafeArea(edges: .top)
        }
    }
}

// MARK: - View + Extensions

extension View {

    func navigationBar(scrollOffset: CGFloat) -> some View {
        modifier(StickyTop {
            NavigationBar(scrollOffset: scrollOffset)
        })
    }
}

// MARK: - Preview

#Preview {
    Color.white.navigationBar(scrollOffset: 0)
}
