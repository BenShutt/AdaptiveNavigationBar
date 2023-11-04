//
//  StickyTop.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 31/10/2023.
//

import SwiftUI

struct StickyTop<Top: View>: ViewModifier {

    @ViewBuilder var top: () -> Top

    func body(content: Content) -> some View {
        content
            .safeAreaInset(edge: .top) {
                top()
            }
    }
}
