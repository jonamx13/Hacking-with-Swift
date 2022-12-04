//
//  ContentView.swift
//  rock paper scissors
//
//  Created by Jonathan Meixueiro on 29/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var options = ["Rock", "Paper", "Scissors"]
    // Randomizer vars
    @State private var choiceRandomizer = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    // Score vars
    @State private var youWin = true
    @State private var score: Int = 0
    @State private var showingScore = false
    @State private var messageScore = ""
    @State private var messageDescription = ""
    
    //Game life-cycle vars
    @State private var finishGame = false
    @State private var playTimes = 5
    
    var body: some View {
        VStack {
            Text("ROCK - PAPER - SCISSORS")
                .font(Font.system(size:28, weight: .bold))
                .foregroundColor(.white)
            Spacer()
            Text(assignIcon(options[choiceRandomizer]))
                .padding(30)
                .font(.system(size: 150))
                .background(.white)
                .clipShape(Circle())
            Spacer()
            
            VStack(spacing: 30) {
                Text(shouldWin ? "You should WIN"
                     : "You should LOSE")
                HStack {
                    ForEach(0..<3) { choice in
                        Button {
                            winLose(options[choiceRandomizer], options[choice])
                        } label: {
                            Text(assignIcon(options[choice]))
                        }.frame(maxWidth: .infinity, maxHeight: 80)
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }// Buttons
            }.padding()
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            // Choice UI
            Spacer()
            Text("Score: \(score)")
                .font(Font.system(size:28, weight: .bold))
                .foregroundColor(.white)
            
        }
        .padding()
        //Alerts
        .alert(messageScore, isPresented: $showingScore) {
            Button("OK", role: .cancel, action: gameResult)
        } message: {
            Text(messageDescription)
        }
        .alert(messageScore, isPresented: $finishGame) {
            Button("OK", role: .cancel, action: resetScore)
        } message: {
            Text(messageDescription)
        }
        
        .background(.red)
       // Body
    } // ContentView
    
    func assignIcon(_ option: String) -> String {
        if option == "Rock" {
            return "🪨"
        } else if option == "Paper" {
            return "📄"
        } else {
            return "✂️"
        }
    } // Assign icon
    
    func winLose(_ cpuChoice: String, _ userChoice: String) {
        let choice = (cpuChoice, userChoice)
        
        switch choice {
                //Should Win
            case ("Rock", "Paper") where shouldWin:
                youWin = true
            case ("Paper", "Scissors") where shouldWin:
                youWin = true
            case ("Scissors", "Rock") where shouldWin:
                youWin = true
                
                //Should Lose
            case ("Paper", "Rock") where shouldWin == false:
                youWin = true
            case ("Scissors", "Paper") where shouldWin == false:
                youWin = true
            case ("Rock", "Scissors") where shouldWin == false:
                youWin = true
            default:
                youWin = false
        }
        //Message
        if youWin == true {
            score += 1
            messageScore = "Correct"
            messageDescription = shouldWin
            ? "You chose \(userChoice) that beats \(cpuChoice)"
            : "You chose \(userChoice) that it's beaten by \(cpuChoice)"
        } else {
            messageScore = "Incorrect"
            score = score > 0 ? score - 1 : 0
            messageDescription = cpuChoice == userChoice
                ? "It's a draw"
                : "You chose \(userChoice) that it's beaten by \(cpuChoice)"
        }
        
        showingScore = true
    }// Win lose function
    
    func gameResult() {
        playTimes -= 1
        if playTimes == 0 {
            finishGame = true
            messageScore = "Game finished"
            messageDescription = "You scored \(score) out of 5"
        }
        options.shuffle()
        shouldWin.toggle()
        choiceRandomizer = Int.random(in: 0...2)
    } // Game result
    
    func resetScore() {
        score = 0
        playTimes = 5
    } // Reset Score
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
