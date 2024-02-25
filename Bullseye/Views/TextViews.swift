//
//  TextViews.swift
//  Bullseye
//
//  Created by Carlos Zinato on 25/02/2024.
//

import SwiftUI

struct InstructionText: View {
    var text: String

    var body: some View {
        Text(text)
            .bold()
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
    }
}

#Preview {
    InstructionText(text: "🎯\nPut the Bullseye as close as you can to:")
}
