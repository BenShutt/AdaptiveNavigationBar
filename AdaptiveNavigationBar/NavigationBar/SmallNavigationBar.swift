//
//  SmallNavigationBar.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 31/10/2023.
//

import SwiftUI

struct SmallNavigationBar: View {

    var body: some View {
        Text("Small Navigation Bar")
            .font(.system(size: 20, weight: .semibold))
            .padding()
    }
}

#Preview {
    Color.white.navigationBar {
        SmallNavigationBar()
    }
}
