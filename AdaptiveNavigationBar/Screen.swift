//
//  Screen.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 31/10/2023.
//

import SwiftUI

struct Screen<Content: View>: View {

    @ViewBuilder var content: () -> Content
    @State private var scrollOffset: CGFloat = 0

    var body: some View {
        OffsetScrollView(
            content: {
                LazyVStack(spacing: 0) {
                    content()
                }
            }, onScroll: { value in
                scrollOffset = value.y
            }
        )
        .navigationBar(scrollOffset: scrollOffset)
    }
}
