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

struct BigNumberText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .kerning(-1.0)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLabelText: View {
    var text: String

    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
    }
}

struct LabelText: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .font(.caption)
            .kerning(1.5)
            .bold()
            .foregroundColor(Color("TextColor"))
            
    }
}

struct BodyText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
    }
}

struct ButtonText: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(12.0)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "🎯\nPut the Bullseye as close as you can to:")
            BigNumberText(text: "99")
            LabelText(text: "round")
            BodyText(text: "You scored 200 points 🔥")
            ButtonText(text: "Start a new round")
        }
        .padding()
    }
}
