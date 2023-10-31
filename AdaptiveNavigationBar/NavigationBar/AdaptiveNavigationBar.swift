//
//  AdaptiveNavigationBar.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 31/10/2023.
//

import SwiftUI

struct AdaptiveNavigationBarView: View {

    var body: some View {
        ZStack(alignment: .bottom) {
            LargeNavigationBar()
            SmallNavigationBar()
        }
    }
}

#Preview {
    Color.white.navigationBar {
        AdaptiveNavigationBarView()
    }
}
