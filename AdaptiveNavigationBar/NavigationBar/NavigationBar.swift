//
//  NavigationBar.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 31/10/2023.
//

import SwiftUI

struct NavigationBar<Top: View>: ViewModifier {

    @ViewBuilder var top: () -> Top

    func body(content: Content) -> some View {
        content
            .safeAreaInset(edge: .top) {
                top()
                    .frame(maxWidth: .infinity)
                    .background(
                        NavigationBarBackground()
                            .ignoresSafeArea()
                    )
            }
    }
}

// MARK: - View + Extensions

extension View {

    func navigationBar(
        @ViewBuilder content: @escaping () -> some View
    ) -> some View {
        modifier(NavigationBar(top: content))
    }
}
