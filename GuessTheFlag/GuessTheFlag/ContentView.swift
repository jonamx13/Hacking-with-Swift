//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jonathan Meixueiro on 11/11/22.
//

import SwiftUI

struct FlagImage: View {
    var flag: String
    
    var body: some View {
        Image(flag)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
    
}

struct ContentView: View {
    //Score variables
    @State private var showingScore: Bool = false
    @State private var scoreWrong: Int = 0
    @State private var scoreCorrect: Int = 0
    
    //Structure game variables
    @State private var scoreTitle: String = ""
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var houses: [String] = ["Arryn", "Baratheon", "Greyjoy", "Lannister", "Martell", "Stark", "Targaryen", "Tully", "Tyrell"].shuffled()
    
    //Game life-cycle variables
    @State private var gameFinish: Bool = false
    private var gameLenght: Int = 8
    
    var body: some View {
        ZStack {
            ZStack {
                Image("background")
                    .resizable()
                    .mask(LinearGradient(gradient: Gradient(colors: [.clear, .black, .black, .clear]), startPoint: .top, endPoint: .bottom))
            } // Background
            
            
            VStack {
                Spacer()
                LinearGradient(gradient: Gradient(colors: [.yellow, .brown]), startPoint: .top, endPoint: .bottom)
                    .frame(maxHeight: 40)
                    .mask(Text("Guess The House")
                        .font(.custom("Game of Thrones", size: 32)))
                // Title
                
                VStack(spacing: 20) {
                    VStack {
                        Text("TAP THE FLAG OF")
                            .foregroundStyle(.secondary)
                            .font(.custom("TrajanPro-Bold", size: 18))
                        Text(houses[correctAnswer])
                            .font(.custom("Game of Thrones", size: 25))
                    } // Instructions
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(flag: houses[number])
                        }
                    } // House flags buttons
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.ultraThinMaterial.opacity(0.7))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10)
                
                // Game UI
                
                Spacer()
                Spacer()
                
                Text("Correct: \(scoreCorrect)")
                    .foregroundColor(.yellow)
                    .font(.custom("TrajanPro-Bold", size: 30))
                Text("Wrong: \(scoreWrong)")
                    .foregroundColor(.white)
                    .font(.custom("TrajanPro-Bold", size: 30))
                
                // Scores
                Spacer()
            }
            .padding()
            // Game screen
        }
        // Alert screens
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", role: .cancel, action: askQuestion)
            Button("Drakarys", role: .destructive, action: resetScore)
        } message: {
            Text("Your score is \(scoreCorrect)")
        }
        .alert("""
            Game finished
            your score was:
            Correct: \(scoreCorrect)
            Wrong: \(scoreWrong)
            """, isPresented: $gameFinish) {
            Button("Drakarys", role: .none, action: resetScore)
                .foregroundColor(.red)

        }
        .environment(\.colorScheme, .dark)
        // Body
    } // ContentView
    
func flagTapped(_ number: Int) {
    if number == correctAnswer {
        scoreCorrect += 1
        scoreTitle = "Correct"
    } else {
        scoreWrong += 1
        scoreTitle = "Wrong, you chose the \(houses[number]) house"
    }
        
        if (scoreCorrect + scoreWrong) == gameLenght {
            gameFinish = true
        }
        
    showingScore = true
}
    
func askQuestion() {
        houses.shuffle()
        correctAnswer = Int.random(in: 0...2)
}
    
func resetScore() {
        houses.shuffle()
        correctAnswer = Int.random(in: 0...2)
        scoreCorrect = 0
        scoreWrong = 0
    }
}

// Ending
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
