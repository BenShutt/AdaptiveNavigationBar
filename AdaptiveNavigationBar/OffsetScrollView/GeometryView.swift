//
//  GeometryView.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 04/11/2023.
//

import SwiftUI

struct GeometryView: View {

    var coordinateSpace: String

    var body: some View {
        GeometryReader { proxy in
            Color.clear
                .preference(
                    key: ScrollOffset.self,
                    value: {
                        let origin = proxy.frame(in: .named(coordinateSpace)).origin
                        return CGPoint(x: -origin.x, y: -origin.y)
                    }()
                )
        }
    }
}
