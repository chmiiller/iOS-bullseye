//
//  ContentView.swift
//  Bullseye
//
//  Created by Carlos Zinato on 26/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        let padding: CGFloat = alertIsVisible ? 0 : 100
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                    .padding(.bottom, padding)
                if alertIsVisible {
                    PointsView(game: $game, sliderValue: $sliderValue, alertIsVisible: $alertIsVisible)
                } else {
                    HitMeButton(game: $game, sliderValue: $sliderValue, alertIsVisible: $alertIsVisible)
                }
            }
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue)
            }
        }
    }
}

struct InstructionsView: View {
    @Binding var game: Game

    var body: some View {
        VStack {
            InstructionText(text: "🎯\nPut the Bullseye as close as you can to:")
                .padding(.horizontal, 30)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double

    var body: some View {
        HStack {
            SliderLabelText(text: "1")
                .frame(width: 35)
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
                .frame(width: 35)
        }
        .padding()
    }
}

struct HitMeButton: View {
    @Binding var game: Game
    @Binding var sliderValue: Double
    @Binding var alertIsVisible: Bool

    var body: some View {
        let gradient = LinearGradient(
            gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]),
            startPoint: .top, endPoint: .bottom
        )
        Button("Hit me".uppercased()) {
            withAnimation {
                alertIsVisible = true
            }
        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                gradient
            }
        )
        .overlay(
            RoundedRectangle(cornerRadius: 21)
                .strokeBorder(Color.white, lineWidth: 2.0)
        )
        .foregroundColor(.white)
        .cornerRadius(21.0)
        .bold()
        .font(.title3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
            .previewDisplayName("Dark Mode")
    }
}
