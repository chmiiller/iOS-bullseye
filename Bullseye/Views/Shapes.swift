//
//  Shapes.swift
//  Bullseye
//
//  Created by Carlos Zinato on 07/04/2024.
//

import SwiftUI

struct Shapes: View {
    @State private var wideShapes = true
    var body: some View {
        VStack {
            if !wideShapes {
                Circle()
    //                .fill(Color.blue)
                    .strokeBorder(Color.blue, lineWidth: 20)
                    .frame(width: 200, height: 100)
                    .background(Color.green)
                    .transition(.opacity)
            }
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: 100)
//                .animation(.easeInOut, value: wideShapes)
            Capsule()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: 100)
            Ellipse()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: 100)
            Button("Animate!") {
                withAnimation {
                    wideShapes.toggle()
                }
            }
        }
    }
}

#Preview {
    Shapes()
}
