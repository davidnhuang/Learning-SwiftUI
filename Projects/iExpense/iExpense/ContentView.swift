//
//  ContentView.swift
//  iExpense
//
//  Created by David Huang (Work) on 4/4/24.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        Spacer()
        Text("Hello, \(name)")
            .font(.title)
        Spacer()
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct ContentView: View {
    
    //SwiftUI comes with a lot of built-in functions with lists
    //on delete, which only works with forEach, has the nice swipe to delete function
    //EditButton, which is built into NavigationStack, allows editing the forEach list
    
    @State private var showSheet = false
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
                .sheet(isPresented: $showSheet, content: {
                    SecondView(name: "Jon Doe")
                })
            }
        }
        .toolbar {
            EditButton()
        }
        
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
    
}

#Preview {
    ContentView().preferredColorScheme(.dark)
}
