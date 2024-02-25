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
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                Text("🎯\nPut the Bullseye as close as you can to:")
                    .bold()
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    .font(.footnote)
                    .kerning(2.0)
                    .padding(.horizontal, 30)
                Text(String(game.target))
                    .font(.largeTitle)
                    .kerning(-1.0)
                    .fontWeight(.black)
                HStack {
                    Text("1")
                        .bold()
                    Slider(value: $sliderValue, in: 1.0...100.0)
                    Text("100")
                        .bold()
                }
                .padding()
                Button("Hit me".uppercased()) {
                    alertIsVisible = true
                }
                .padding(20.0)
                .background(
                    Color.blue
                )
                .foregroundColor(.white)
                .cornerRadius(21.0)
                .bold()
                .font(.title3)
                .alert(
                    "Hi there",
                   isPresented: $alertIsVisible,
                    actions: {
                        Button("OK") {
                            print("Closed alert")
                        }
                    },
                   message: {
                       let roundValue = Int(sliderValue.rounded())
                       Text("""
                            Slider value is: \(roundValue).
                            You scored \(game.points(sliderValue: roundValue))
                        """)
                   }
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
