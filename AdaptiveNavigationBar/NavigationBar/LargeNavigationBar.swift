//
//  LargeNavigationBar.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 31/10/2023.
//

import SwiftUI

struct LargeNavigationBar: View {

    @Binding var progress: Double

    var body: some View {
        Text("Large Navigation Bar")
            .font(.system(size: 30, weight: .bold))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .compositingGroup()
            .opacity(1 - progress)
    }
}

#Preview {
    Color.white.navigationBar {
        LargeNavigationBar(progress: .constant(0))
    }
}
