//
//  SmallNavigationBar.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 31/10/2023.
//

import SwiftUI

struct SmallNavigationBar: View {

    @Binding var progress: Double

    var body: some View {
        Text("Small Navigation Bar")
            .font(.system(size: 20, weight: .semibold))
            .padding()
            .compositingGroup()
            .opacity(progress)
    }
}

#Preview {
    Color.white.navigationBar {
        SmallNavigationBar(progress: .constant(1))
    }
}
