//
//  ContentView.swift
//  WeSplit
//  Simple app designed to easily split a bill among a number of individuals
//
//  Created by David Huang on 2/19/24.
//

import SwiftUI

struct ContentView: View {
    // @State reloads UI everytime a state changes, which is awesome
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 18
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [15, 18, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople+2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount*(tipSelection/100)
        let grandTotal = checkAmount + tipValue
        return grandTotal/peopleCount
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Check Total") {
                    // Here we created a text field inside the section
                    // Text field is taking in a couple parameters
                    // Amount is the placeholder text
                    // Value is the actual value rather than converting a string into the property type
                    // format is determining the format of the input, this this case we are using the currency format
                    //     we make the format of currency even more robust by using Locale, which checks the devices locale setting
                    //     if Locale is returning nil, default to "USD"
                    TextField("Total Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Split among", selection: $numberOfPeople) {
                        ForEach(2..<13) { number in
                            Text("\(number) people")
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section("Tip") {
                    Picker("Tip Selection", selection: $tipPercentage) {
                        // For this ForEach, instead of using the trailing syntax, we use the $ format for even shorter code. Behaves the same as num in Text("\(num)")
                        ForEach(tipPercentages, id: \.self) { Text("\($0)%")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Split among \(numberOfPeople+2) people") {
                    // Text view that reads and updates when there are updates to checkAmount
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("We Split")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
