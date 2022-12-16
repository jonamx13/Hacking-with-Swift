//
//  ContentView.swift
//  WordScramble
//
//  Created by Jonathan Meixueiro on 09/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var score = 0
    @State private var lastWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    // Enter word
                    Section {
                        TextField("Enter your word", text: $newWord)
                            .autocapitalization(.none)
                    }
                    // Valid words
                    Section {
                        ForEach(usedWords, id: \.self) { word in
                            HStack {
                                Image(systemName: "\(word.count).circle")
                                Text(word)
                            }
                        }
                    }
                }
                .navigationTitle(rootWord)
                .onSubmit(addNewWord)
                .onAppear(perform: startGame)
                .alert(errorTitle, isPresented: $showingError) {
                    Button("OK", role: .cancel) { }
                } message: {
                    Text(errorMessage)
                }
                .toolbar {
                    HStack {
                        Button("Restart") {
                            startGame()
                            newWord = ""
                            lastWord = ""
                            usedWords = []
                            score = 0
                        }
                        Button("Next") {
                            startGame()
                            newWord = ""
                        }
                    }
                }
            } // NavigationView
            //Score
            VStack {
                Spacer()
                Section {
                    VStack {
                        Text("Score:")
                            .font(.largeTitle)
                        Text("\(score)")
                            .font(.title2)
                            .foregroundColor(.blue)
                        Text("Last word:")
                            .font(.largeTitle)
                        Text(lastWordMessage())
                            .font(.title2)
                            .foregroundColor(.blue)
                    }
                    .frame(minWidth: 100, maxWidth: .infinity, minHeight: 50, maxHeight: 150)
                    .background(.thinMaterial)
                }
            } // VStack Score
        } // ZStack
    } // View
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isAllowed(word: answer) else {
            let notAllowedTitle = answer.count <= 3 ? "Not long enough" : "Same word as title"
            let notAllowedMessage = answer.count <= 3 ? "You have to use at least 4 letters" : "Title itself is not allowed"
            
            wordError(title: notAllowedTitle , message: notAllowedMessage)
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        score += 1
        newWord = ""
        lastWord = answer
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
    fatalError("Could not load start.txt from bundle.")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func isAllowed(word: String) -> Bool {
        if word.count <= 3 || word == rootWord {
            return false
        } else {
            return true
        }
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    func lastWordMessage() -> String {
        if lastWord != "" {
            return "'\(lastWord)' using \(lastWord.count) letters"
        } else {
            return ""
        }
    }
    //ContentView
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
