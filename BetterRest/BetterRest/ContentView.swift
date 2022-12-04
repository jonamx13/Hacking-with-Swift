//
//  ContentView.swift
//  BetterRest
//
//  Created by CGTI9 on 02/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    var body: some View {
        VStack {
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
            DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
            .labelsHidden()
            DatePicker("Only future days", selection: $wakeUp, in: Date.now...)
            Text(Date.now.formatted(date: .long, time: .shortened))
        }
    }//View
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
