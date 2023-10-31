//
//  LargeNavigationBar.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 31/10/2023.
//

import SwiftUI

struct LargeNavigationBar: View {

    var body: some View {
        Text("Large Navigation Bar")
            .font(.system(size: 30, weight: .bold))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
    }
}

#Preview {
    Color.white.navigationBar {
        LargeNavigationBar()
    }
}
