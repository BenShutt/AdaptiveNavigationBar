//
//  OffsetScrollView.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 04/11/2023.
//

import SwiftUI

// TODO: Performance?
struct OffsetScrollView<Content: View>: View {

    private let coordinateSpace = "\(Self.self)"
    @ViewBuilder var content: () -> Content
    var onScroll: (CGPoint) -> Void

    var body: some View {
        ScrollView {
            content()
                .background {
                    GeometryView(coordinateSpace: coordinateSpace)
                }
        }
        .coordinateSpace(name: coordinateSpace)
        .onPreferenceChange(OffsetScroll.self) { value in
            onScroll(value)
        }
    }
}
