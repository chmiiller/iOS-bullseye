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
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            addToLeaderboard(score: 100)
            addToLeaderboard(score: 80)
            addToLeaderboard(score: 230)
            addToLeaderboard(score: 50)
            addToLeaderboard(score: 590)
            addToLeaderboard(score: 12)
            addToLeaderboard(score: 617)
            addToLeaderboard(score: 90)
            addToLeaderboard(score: 101)
        }
    }
    
    func points(sliderValue: Int) -> Int {
        let difference: Int = abs(target - sliderValue)
        let initialScore: Int = 100 - difference
        var bonus: Int = 0
        if difference == 0 {
            // player gets 100 points extra when is an exact match!
            bonus = 100
        } else if difference <= 2 {
            // player gets 50 points extra when is 2 points close
            bonus = 50
        }
        return initialScore + bonus
    }
    
    mutating func startNewRound(points: Int) {
        addToLeaderboard(score: points)
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
    
    mutating func addToLeaderboard(score: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: score, date: Date()))
        sortLeaderboardEntries()
    }
    
    private mutating func sortLeaderboardEntries() {
        leaderboardEntries.sort { entry1, entry2 in
            entry1.score > entry2.score
        }
    }
}

struct LeaderboardEntry {
    let score: Int
    let date: Date
}
