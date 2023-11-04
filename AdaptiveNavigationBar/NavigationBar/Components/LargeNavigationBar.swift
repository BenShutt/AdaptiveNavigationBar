//
//  LargeNavigationBar.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 04/11/2023.
//

import SwiftUI

struct LargeNavigationBar: View {

    var vPadding: CGFloat = .vPadding

    var body: some View {
        VStack(spacing: 5) {
            Text("Large Navigation Bar")
                .font(.system(size: .largeFont, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)

            Text("With more content that is used for the subtitle")
                .font(.system(size: .smallFont, weight: .regular))
                .foregroundStyle(Color.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, .hPadding)
        .padding(.vertical, vPadding)
    }
}
