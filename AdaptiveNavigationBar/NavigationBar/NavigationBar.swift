//
//  NavigationBar.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 31/10/2023.
//

import SwiftUI

/// Custom view used for navigation bar UI.
/// The view transitions from a large to small state as the scroll offset increases.
struct NavigationBar: View {

    /// Critical scroll offset in Y for the different states
    private let maxOffsetY: CGFloat = 100

    /// The content offset in Y of the scroll view
    var offsetY: CGFloat

    /// Value in `[0, 1]` from not scrolled to fully scrolled (respectively)
    private var progress: CGFloat {
        max(0, min(maxOffsetY, offsetY)) / maxOffsetY
    }

    /// Opacity of the small navigation bar as a function of progress
    private var smallOpacity: CGFloat {
        max(0, 2 * progress - 1)
    }

    /// Opacity of the large navigation bar as a function of progress
    private var largeOpacity: CGFloat {
        max(0, 1 - 2 * progress)
    }

    /// Offset in Y of the large navigation bar as a function of progress
    private var largeOffset: CGFloat {
        min(0, max(-offsetY, -maxOffsetY))
    }

    var body: some View {
        ZStack(alignment: .top) {
            SmallNavigationBar()
                .opacity(smallOpacity)

            LargeNavigationBar()
                .opacity(largeOpacity)
                .offset(y: largeOffset)
                .modifier(ClippedHeight { maxHeight in
                    maxHeight * (1 - progress)
                })
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
