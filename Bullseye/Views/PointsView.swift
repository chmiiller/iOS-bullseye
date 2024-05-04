//
//  PointsView.swift
//  Bullseye
//
//  Created by Carlos Zinato on 04/05/2024.
//

import SwiftUI

struct PointsView: View {
    @Binding var game: Game
    @Binding var sliderValue: Double
    @Binding var alertIsVisible: Bool
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        VStack(spacing: 14, content: {
            InstructionText(text: "The slider's value is:")
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You Scored \(points) points 🔥")
            Button {
                alertIsVisible = false
                game.startNewRound(points: points)
            } label: {
                ButtonText(text: "Start new round")
            }
        })
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(21)
        .shadow(radius: 10, x: 5, y: 5)
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    static var previews: some View {
        PointsView(game: game, sliderValue: sliderValue, alertIsVisible: alertIsVisible)
        PointsView(game: game, sliderValue: sliderValue, alertIsVisible: alertIsVisible)
            .previewInterfaceOrientation(.landscapeRight)
            .preferredColorScheme(.dark)
    }
}
