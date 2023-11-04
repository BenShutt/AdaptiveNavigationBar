//
//  OffsetScrollView.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 04/11/2023.
//

import SwiftUI

// TODO: Performance? Is @Binding worse than closure?
struct OffsetScrollView<Content: View>: View {

    private let coordinateSpace = "\(Self.self)"
    @Binding var offset: CGPoint
    @ViewBuilder var content: () -> Content

    var body: some View {
        ScrollView {
            content()
                .background {
                    GeometryView(coordinateSpace: coordinateSpace)
                }
        }
        .coordinateSpace(name: coordinateSpace)
        .onPreferenceChange(ScrollOffset.self) { value in
            offset = value
        }
    }
}
