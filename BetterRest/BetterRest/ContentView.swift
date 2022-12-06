//
//  ContentView.swift
//  BetterRest
//
//  Created by Jonathan Meixueiro on 04/12/22.
//

import CoreML
import SwiftUI

struct CenterText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity,alignment: .center)
    }
}

extension View {
    func centerTitle() -> some View {
        modifier(CenterText())
    }
}

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 0
        
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var idealBedTime: String {
        var idealBedTime = ""
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            idealBedTime = sleepTime.formatted(date: .omitted, time: .shortened)
            return idealBedTime
        } catch {
            idealBedTime = "Sorry, there was a problem calculating your bedtime"
            return idealBedTime
        }
    }
    //App beggining
    var body: some View {
        NavigationView {
            Form {
                //Clock
                Section {
                    DatePicker("Please enter an hour", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .centerTitle()
                } header: {
                    Text("When do you want to wake up?")
                        .font(.headline)
                }
                .listRowBackground(Color.clear)
                
                //Hours desired
                Section {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                } header: {
                    Text("Desired amount of sleep")
                        .font(.headline)
                }
                
                //Amount of coffee
                Section {
                    Picker("", selection: $coffeeAmount) {
                        ForEach(1..<21) {
                            Text("\($0) cup")
                        }
                    }
                } header: {
                    Text("Daily coffee intake")
                        .font(.headline)
                }
                
                //Ideal bedtime
                Section {
                    Text(idealBedTime)
                        .font(.system(size: 30))
                        .foregroundColor(Color.blue)
                } header: {
                    Text("You ideal bedtime is...")
                        .font(.headline)
                }
                .listRowBackground(Color.clear)
                .centerTitle()            }
            .navigationTitle("BetterRest")
            // Form
        }// NavigationView
    }// View
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
