//
//  GeometryView.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 04/11/2023.
//

import SwiftUI

struct GeometryView: View {

    var coordinateSpace: String

    private func offset(with proxy: GeometryProxy) -> CGPoint {
        let origin = proxy.frame(in: .named(coordinateSpace)).origin
        return CGPoint(x: -origin.x, y: -origin.y)
    }

    var body: some View {
        GeometryReader { proxy in
            Color.clear
                .preference(key: OffsetScroll.self, value: offset(with: proxy))
        }
    }
}
