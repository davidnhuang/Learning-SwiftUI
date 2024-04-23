//
//  ContentView.swift
//  iExpense
//
//  Created by David Huang (Work) on 4/4/24.
//

import SwiftUI

// structure of a single expense item
// for it to conform to identifiable, you must have an id component to the struct
// this also means we don't have to have the id:\.id in our forEach closure
struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    // class that stores many expense items in an array
    var items = [ExpenseItem]()
}

struct ContentView: View {
    
    @State private var expenses = Expenses()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItem)
            }
            .navigationTitle("Expenses")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    let expense = ExpenseItem(name: "Text", type: "Personal", amount: 2)
                    expenses.items.append(expense)
                }
            }
        }
    }
    
    func removeItem(at offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }
    
}

#Preview {
    ContentView().preferredColorScheme(.dark)
}
