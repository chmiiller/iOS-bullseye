//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Carlos Zinato on 07/04/2024.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56, height: 56)
            .overlay() {
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
            }
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: 56, height: 56)
            .background() {
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            }
    }
}

struct RoundRectTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .kerning(-0.2)
            .font(.title3)
            .bold()
            .foregroundColor(Color("TextColor"))
            .frame(width: 68, height: 56)
            .overlay() {
                RoundedRectangle(cornerRadius: 21.0)
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
                
            }
    }
}

struct PreviewView: View {
    var body: some View {
        VStack(spacing: 20) {
            RoundedImageViewFilled(systemName: "arrow.counterclockwise")
            RoundedImageViewStroked(systemName: "list.dash")
            RoundRectTextView(text: "99")
        }
    }
}


struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
            .previewDisplayName("Dark Mode")
    }
}
