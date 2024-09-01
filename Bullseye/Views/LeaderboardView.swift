//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Carlos Zinato on 01/09/2024.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var leaderboardVisible: Bool
    @Binding var game: Game
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            VStack(spacing: 10, content: {
                HeaderView(leaderboardVisible: $leaderboardVisible)
                LabelView()
                ScrollView {
                    VStack(spacing: 10, content: {
                        ForEach(game.leaderboardEntries.indices, id: \.self) { index in
                            let entry = game.leaderboardEntries[index]
                            RowView(index: index + 1, score: entry.score, date: entry.date)
                        }
                        
                    })
                }
            })
        }
        
    }
}

struct HeaderView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Binding var leaderboardVisible: Bool

    var body: some View {
        ZStack {
            HStack {
                BigBoldText(text: "Leaderboard")
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    Spacer()
                }
            }
            HStack {
                Spacer()
                Button(action: {
                    leaderboardVisible = false
                }, label: {
                    RoundedImageViewFilled(systemName: "xmark")
                })
            }
        }.padding([.horizontal, .top])
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer().frame(width: Constants.roundedViewLength)
            Spacer()
            LabelText(text: "Score").frame(width: Constants.Leaderboard.scoreColumnWidth)
            Spacer()
            LabelText(text: "Date").frame(width: Constants.Leaderboard.dateColumnWidth)
        }.padding(.horizontal).frame(maxWidth: Constants.Leaderboard.maxRowWidth)
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.scoreColumnWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.Leaderboard.dateColumnWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.strokeWidth)
        )
        .padding(.horizontal)
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static private var leaderboardVisible = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestData: true))
    static var previews: some View {
        LeaderboardView(leaderboardVisible: leaderboardVisible, game: game)
            .previewInterfaceOrientation(.landscapeRight)
        LeaderboardView(leaderboardVisible: leaderboardVisible, game: game)
            .preferredColorScheme(.dark)
    }
}
