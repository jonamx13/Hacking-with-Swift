//
//  ContentView.swift
//  TemperatureConversor
//
//  Created by Jonathan Meixueiro on 09/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Double = 0
    let celsius: Double = 0
    let kelvin: Double = 273.15
    let fahrenheit: Double = 32

    @State private var selectedFrom = "Celsius"
    @State private var selectedTo = "Fahrenheit"
    @State private var inputTempSymbol = "ºC"
    @FocusState private var valueFocused: Bool
    
    let temptNames = ["Celsius","Kelvin","Fahrenheit"]
    let temptSymbols = ["ºC","K","ºF"]
    
    var tempConverter: (Double, String) {
        let conversion = (from: selectedFrom, to: selectedTo)
        
        switch (conversion) {
            //Celsius
        case (temptNames[0], temptNames[0]):
            return (selection + celsius, temptSymbols[0])
        case (temptNames[0], temptNames[1]):
            return ((selection + celsius) + 273.15, temptSymbols[1])
        case (temptNames[0], temptNames[2]):
            return ((selection * 9/5) + 32, temptSymbols[2])
            
            //Kelvin
        case (temptNames[1], temptNames[0]):
            return (selection - 273.15, temptSymbols[0])
        case (temptNames[1], temptNames[1]):
            return (selection, temptSymbols[1])
        case (temptNames[1], temptNames[2]):
            return ((selection - 273.15) * 9/5 + 32, temptSymbols[2])
            
            //Fahrenheit
        case (temptNames[2], temptNames[0]):
            return ((selection - 32) * 5/9, temptSymbols[0])
        case (temptNames[2], temptNames[1]):
            return ((selection - 32) * 5/9 + 273.15, temptSymbols[1])
        case (temptNames[2], temptNames[2]):
            return (selection, temptSymbols[2])
            
            //Default
        default:
            return ((celsius * 9/5) + 32, temptNames[2])
            
        }
        
    }
    var tempConvResult: String {  "\(tempConverter.0)\(tempConverter.1)"
        
    }
    
    init() {
            UISegmentedControl.appearance().selectedSegmentTintColor = .systemGreen
            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Convert From",selection: $selectedFrom) {
                        ForEach(temptNames, id: \.self) {
                            Text("\($0)")
                        }
                    }.pickerStyle(.segmented)
                }  header: {
                    Text("Convert from")
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 15))
                } // Convert from
                
                Section {
                    Picker("Convert to",selection: $selectedTo) {
                        ForEach(temptNames, id: \.self) {
                            Text("\($0)")
                        }
                        
                    }.pickerStyle(.segmented)
                }  header: {
                    Text("to")
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 15))
                } // Convert to
                
                Section {
                    TextField("", value: $selection, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($valueFocused)
                        .multilineTextAlignment(.center)
                } footer: {
                    Text("\(inputTempSymbol)")
                        .foregroundColor(.cyan)
                }
                .frame(maxWidth: .infinity)
                .font(.system(size: 30))
                    //Input
                
                Section {
                    Text(tempConvResult)
                } //Output
            }.navigationTitle("Temperature Converter")
                .toolbar {
                    ToolbarItemGroup (placement: .keyboard) {
                        Button("Done") {
                            valueFocused = false
                        }
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
