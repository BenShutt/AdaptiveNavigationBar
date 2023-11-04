//
//  Screen.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 31/10/2023.
//

import SwiftUI

struct Screen<Content: View>: View {

    @ViewBuilder var content: () -> Content
    @State private var offset: CGPoint = .zero

    var body: some View {
        OffsetScrollView(offset: $offset) {
            LazyVStack(spacing: 0) {
                content()
            }
        }
        .navigationBar(offsetY: offset.y)
    }
}
