//
//  Game.swift
//  Bullseye
//
//  Created by Carlos Zinato on 26/01/2024.
//

import Foundation

struct Game {
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    
    func points(sliderValue: Int) -> Int {
        let diff: Int = abs(target - sliderValue)
        return 100 - diff
    }
}
