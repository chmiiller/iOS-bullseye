//
//  Game.swift
//  Bullseye
//
//  Created by Carlos Zinato on 26/01/2024.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    func points(sliderValue: Int) -> Int {
        let initialScore: Int = 100 - abs(target - sliderValue)
        var bonus: Int = 0
        if initialScore == 100 {
            // player gets 100 points extra when is an exact match!
            bonus = 100
        } else if initialScore == 98 {
            // player gets 50 points extra when is 2 points close
            bonus = 50
        }
        return initialScore + bonus
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}
