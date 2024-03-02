//
//  ContentView.swift
//  WeSplit
//
//  Created by David Huang on 2/18/24.
//

import SwiftUI

struct ContentView: View {
    
    let names = ["Jon", "Jane", "Adam", "Johnny"]
    
    // @State manages the state of properties and allows us to change var in struct
    // private signals that this property is only used here
    @State private var tapCount = 0
    @State private var name = ""
    @State private var selectedName = "Jon"
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Enter your name", text: $selectedName)
                // binding changes are reflected here on change - no $ means just read only
                Text("You name is \(selectedName)")
                Picker("Select a name", selection: $selectedName) {
                    // For each is a closure that works like a for loop
                    // This loop will show as a popup context menu
                    ForEach(names, id: \.self) { name in
                        Text(name)
                    }
                }
            }
            .navigationTitle("\(selectedName)")
            Button("Tap Count: \(tapCount)") {
                tapCount += 1
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        
    }
}

#Preview {
    ContentView()
}
