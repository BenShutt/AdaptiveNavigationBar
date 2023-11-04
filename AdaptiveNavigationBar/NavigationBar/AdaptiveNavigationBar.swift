//
//  AdaptiveNavigationBar.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 31/10/2023.
//

import SwiftUI

struct AdaptiveNavigationBarView: View {

    var isLarge: Bool

    var body: some View {
        ZStack(alignment: .bottom) {
            LargeNavigationBar()
                .opacity(isLarge ? 1 : 0)

            SmallNavigationBar()
                .opacity(isLarge ? 0 : 1)
        }
    }
}

#Preview {
    Color.white.navigationBar {
        AdaptiveNavigationBarView(isLarge: true)
    }
}
