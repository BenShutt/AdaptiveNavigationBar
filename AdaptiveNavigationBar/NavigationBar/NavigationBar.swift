//
//  NavigationBar.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 31/10/2023.
//

import SwiftUI

/// A view used as a custom top safe area for navigation bar UI
struct NavigationBar: View {

    /// Max height of the large navigation bar
    @State private var maxLargeHeight: CGFloat = 0

    /// Max height of the small navigation bar
    @State private var maxSmallHeight: CGFloat = 0

    /// Critical scroll offset in Y for the different states
    private let maxOffsetY: CGFloat = 100

    /// The content offset in Y of the scroll view
    var offsetY: CGFloat

    /// Value in `[0, 1]` from not scrolled to fully scrolled
    private var progress: CGFloat {
        max(0, min(maxOffsetY, offsetY)) / maxOffsetY
    }

    var body: some View {
        Color.clear
            .overlay(alignment: .top) {
                LargeNavigationBar()
                    .opacity(max(0, CGFloat(1) - 2 * progress))
                    .onSizeChanged { size in
                        let newSize = size.height
                        if newSize > maxLargeHeight {
                            maxLargeHeight = newSize
                        }
                    }
                    .offset(y: min(0, max(-offsetY, -maxOffsetY)))
                    .fixedSize(horizontal: false, vertical: true) // TODO
            }
            .overlay(alignment: .top) {
                SmallNavigationBar()
                    .opacity(max(0, 2 * progress - CGFloat(1)))
                    .onSizeChanged { size in
                        let newSize = size.height
                        if newSize > maxSmallHeight {
                            maxSmallHeight = newSize
                        }
                    }
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(maxWidth: .infinity)
            .frame(height: max(maxLargeHeight * (1 - progress), maxSmallHeight))
            .clipped()
            .background {
                NavigationBarBackground()
                    .ignoresSafeArea(edges: .top)
            }
            .overlay(Color.orange.opacity(0.1))
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
    Color.white.navigationBar(offsetY: 45)
}

// TODO: Tmp
struct ProgressLayout: Layout {

    var height: CGFloat

    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {
        subviews.reduce(CGSize.zero) { result, subview in
            let size = subview.sizeThatFits(proposal)
            return CGSize(
                width: max(result.width, size.width),
                height: max(result.height, size.height * subview.priority)
            )
        }
    }

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {
        let width = proposal.width ?? 0
        subviews.forEach { subview in
            subview.place(
                at: bounds.origin,
                anchor: .topLeading,
                proposal: .init(width: width, height: nil)
            )
        }
    }
}

