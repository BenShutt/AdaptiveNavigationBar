//
//  LargeNavigationBar.swift
//  AdaptiveNavigationBar
//
//  Created by Ben Shutt on 04/11/2023.
//

import SwiftUI

struct LargeNavigationBar: View {

    var body: some View {
        VStack(alignment: .leading, spacing: .small) {
            Text("Large Navigation Bar")
                .font(.system(size: .largeFont, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)

            Text("With even more content that is used for the subtitle to add another line for preview")
                .font(.system(size: .smallFont, weight: .regular))
                .foregroundStyle(Color.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .multilineTextAlignment(.leading)
        .padding(.horizontal, .hPadding)
        .padding(.vertical, .vPadding)
    }
}
