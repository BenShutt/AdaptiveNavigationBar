//
//  AdaptiveNavigationBar.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 31/10/2023.
//

import SwiftUI

struct AdaptiveNavigationBarView: View {

    @Binding var progress: Double

    var body: some View {
        ZStack(alignment: .bottom) {
            LargeNavigationBar(progress: $progress)
            SmallNavigationBar(progress: $progress)
        }
    }
}

#Preview {
    Color.white.navigationBar {
        AdaptiveNavigationBarView(progress: .constant(0.5))
    }
}
