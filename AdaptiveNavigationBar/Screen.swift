//
//  Screen.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 31/10/2023.
//

import SwiftUI

struct Screen<Content: View>: View {

    @ViewBuilder var content: () -> Content
    @State private var isLarge = false

    var body: some View {
        OffsetScrollView(
            content: {
                LazyVStack(spacing: 0) {
                    LargeNavigationBar()
                    content()
                }
            }, onScroll: { point in
                let isScrolled = point.y >= 20
                if isScrolled != isLarge {
                    withAnimation {
                        isLarge = isScrolled
                    }
                }

            }
        )
        .overlay(alignment: .top) {
            SmallNavigationBar()
                .opacity(isLarge ? 1 : 0)
        }
    }
}
