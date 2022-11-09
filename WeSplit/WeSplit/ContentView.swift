//
//  ContentView.swift
//  WeSplit
//
//  Created by Jonathan Meixueiro
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 15
    
    @FocusState private var amountIsFocused: Bool
    @State private var darkMode: Bool = false
    
    let tipPercentages = [0,10, 15, 20, 25]
    
    var totalWithTip: Double {
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson = totalWithTip / peopleCount
        
        return amountPerPerson
    }
    
    var currencyFormatter: FloatingPointFormatStyle<Double>.Currency {
        .currency(code: Locale.current.currencyCode ?? "USD")
    }
    
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .systemCyan
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: currencyFormatter)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                        .multilineTextAlignment(.trailing)
                        .font(.system(size: 30))
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                // Section 1: Total & number or people
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id:\.self) {
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.segmented)

                } header: {
                    Text("How much tip do you want to leave?")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(size: 15))
                }
                .listRowBackground(Color.clear)
                // Section 2: Tip picker
                
                Section {
                    Text(totalWithTip, format: currencyFormatter)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(size: 30))
                        .foregroundColor(Color.blue)
                } header: {
                    Text("Total amount")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(size: 15))
                }
                .listRowBackground(Color.clear)
                // Section 3: Total amount with tip
                
                Section {
                    Text(totalPerPerson, format: currencyFormatter)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(size: 30))
                        .foregroundColor(Color.blue)
                } header: {
                    Text("Amount per person")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(size: 15))
                }
                .listRowBackground(Color.clear)
                // Section 4: Check Amount
            }
            .navigationTitle("WeSplit")
            .navigationBarItems(trailing:
                Toggle(isOn: $darkMode) {
                let toggleText: String = darkMode ? "Light" : "Dark"
                        Text(toggleText)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(.system(size: 15))
                        }
                .toggleStyle(.switch)
                        .tint(.cyan))
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
        .environment(\.colorScheme, darkMode ? .dark : .light)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
