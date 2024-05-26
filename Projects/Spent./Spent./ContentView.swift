//
//  ContentView.swift
//  Spent.
//
//  Created by David Huang on 4/29/24.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let label: String
    let category: String
    let amount: Double
    let date: String
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.setValue(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
    }
}

struct ContentView: View {
    @State private var showCategoryPicker = false
    @State private var showSpentAlert = false
    @State private var enteredAmount = 0.0
    
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    // todo: don't use navigation stack, use presentation modal
    var body: some View {
        VStack {
            Spacer()
            Text("$0.00")
                .font(.title)
            Spacer()
            Button("Next", systemImage: "arrow.right") {
                showCategoryPicker = true
            }
            .fullScreenCover(isPresented: $showCategoryPicker, content: {
                CategoryPicker()
            })
            .labelStyle(.iconOnly)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
