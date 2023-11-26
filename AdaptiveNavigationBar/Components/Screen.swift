//
//  Screen.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 31/10/2023.
//

import SwiftUI

struct Screen<Content: View>: View {

    @State private var offset: CGPoint = .zero
    @ViewBuilder var content: () -> Content

    var body: some View {
        OffsetScrollView(offset: $offset) {
            LazyVStack(spacing: 0) {
                content()
            }
        }
        .navigationBar(offsetY: offset.y)
    }
}
