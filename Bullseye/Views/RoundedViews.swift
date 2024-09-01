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
            .frame(width: Constants.roundedViewLength, height: Constants.roundedViewLength)
            .overlay() {
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.strokeWidth)
            }
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.roundedViewLength, height: Constants.roundedViewLength)
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
            .frame(width: Constants.roundRectViewWidth, height: Constants.roundRectViewHeight)
            .overlay() {
                RoundedRectangle(cornerRadius: Constants.roundRectCornerRadius)
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.strokeWidth)
                
            }
    }
}

struct RoundedTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .font(.title3)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.roundedViewLength, height: Constants.roundedViewLength)
            .overlay() {
                Circle()
                    .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.strokeWidth)
            }
            
    }
}

struct PreviewView: View {
    var body: some View {
        VStack(spacing: 20) {
            RoundedImageViewFilled(systemName: "arrow.counterclockwise")
            RoundedImageViewStroked(systemName: "list.dash")
            RoundRectTextView(text: "99")
            RoundedTextView(text: "1")
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
