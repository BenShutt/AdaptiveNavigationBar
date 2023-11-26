//
//  ClippedHeight.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 26/11/2023.
//

import SwiftUI

struct ClippedHeight: ViewModifier {

    @State private var maxHeight: CGFloat = 0
    var scaledHeight: (CGFloat) -> CGFloat

    func body(content: Content) -> some View {
        Color.clear
            .overlay(alignment: .top) {
                content
                    .fixedSize(horizontal: false, vertical: true)
                    .onSizeChanged { size in
                        maxHeight = max(maxHeight, size.height)
                    }
            }
            .frame(height: scaledHeight(maxHeight))
            .clipped()
    }
}
