//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jonathan Meixueiro on 11/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreWrong = 0
    @State private var scoreCorrect = 0
    @State private var scoreTitle = ""
    @State private var houses = ["Arryn", "Baratheon", "Greyjoy", "Lannister", "Martell", "Stark", "Targaryen", "Tully", "Tyrell"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var gold = #colorLiteral(red:0.9882352941, green: 0.7607843137, blue: 0, alpha: 1)
    
    var body: some View {
        ZStack {
            ZStack {
                Image("background")
                    .resizable()
                    .mask(LinearGradient(gradient: Gradient(colors: [.clear, .black, .black, .clear]), startPoint: .top, endPoint: .bottom))
            }
            
            
            VStack {
                Spacer()
                LinearGradient(gradient: Gradient(colors: [.yellow, .brown]), startPoint: .top, endPoint: .bottom)
                    .frame(maxHeight: 40)
                    .mask(Text("Guess The House")
                        .font(.custom("Game of Thrones", size: 32)))
                
                VStack(spacing: 20) {
                    VStack {
                        Text("TAP THE FLAG OF")
                            .foregroundStyle(.secondary)
                            .font(.custom("TrajanPro-Bold", size: 18))
                        Text(houses[correctAnswer])
                            .font(.custom("Game of Thrones", size: 25))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(houses[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.ultraThinMaterial.opacity(0.7))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10)
                
                Spacer()
                Spacer()
                
                Text("Correct: \(scoreCorrect)")
                    .foregroundColor(.yellow)
                    .font(.custom("TrajanPro-Bold", size: 30))
                Text("Wrong: \(scoreWrong)")
                    .foregroundColor(.white)
                    .font(.custom("TrajanPro-Bold", size: 30))
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", role: .cancel, action: askQuestion)
            Button("Drakarys", role: .destructive, action: resetScore)
        } message: {
            Text("Your score is \(scoreCorrect)")
        }
        .environment(\.colorScheme, .dark)
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreCorrect += 1
            scoreTitle = "Correct"
        } else {
            scoreWrong += 1
            scoreTitle = "Wrong"
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
