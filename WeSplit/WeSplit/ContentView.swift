//
//  ContentView.swift
//  WeSplit
//
//  Created by Jonathan Meixueiro on 06/11/22.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        Form {
            Picker("Select your student", selection: $selectedStudent) {
                ForEach(students, id: \.self) {
                    Text($0)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
