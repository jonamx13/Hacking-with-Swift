//
//  ContentView.swift
//  WordScramble
//
//  Created by Jonathan Meixueiro on 09/12/22.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    var body: some View {
        List {
            Section("Section 1") {
                Text("Hello Mercury")
                Text("Hello Venus")
            }
            Section("Section 2") {
                ForEach(people, id: \.self) {
                    Text($0)
                }
            }
            Section("Section 3") {
                Text("Hello Mars!")
                Text("Hello Jupiter!")
            }
        }
        .listStyle(.grouped)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
