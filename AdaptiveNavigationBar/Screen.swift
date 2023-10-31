//
//  Screen.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 31/10/2023.
//

import SwiftUI

struct Screen<Content: View>: View {

    @ViewBuilder var content: () -> Content

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                content()
            }
        }
        .navigationBar {
            AdaptiveNavigationBarView()
        }
    }
}
