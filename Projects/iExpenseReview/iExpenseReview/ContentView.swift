//
//  ContentView.swift
//  iExpenseReview
//
//  Created by David Huang on 5/25/24.
//

import SwiftUI

// Create the structure of the data for our expense item
// Identifiable makes each ExpenseItem unique with ID property
// Codable makes it possible to be saved
struct ExpenseItem: Identifiable, Codable {
    var id = UUID() // generate new uuid everytime it's created
    // Properties
    let name: String
    let type: String
    let amount: Double
}

// Allows multiple different views to access Expenses
@Observable
class Expenses {
    var items = [ExpenseItem]() {
        // Here, we will make it so data can be stored to the disk using JSON encoder
        // This is the writing part
        didSet {
            // Try creating an encoder and encode var items
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    // Create a custom initializer to allow reading the data
    init() {
        // Here, we will make it so data can be read
        if let savedItem = UserDefaults.standard.data(forKey: "Items") {
            // try decoding it into an array decodedItMES
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItem) {
                items = decodedItems
                return
            }
        }
        
        // If all fails, array is empty
        items = []
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showAddExpense = false
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(expenses.items.reversed()) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                            Text(item.type)
                                .font(.caption)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                    
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Expenses Review")
            .toolbar {
                Button("Add", systemImage: "plus") {
                    showAddExpense = true
                }
            }
            .sheet(isPresented: $showAddExpense) {
                // REALLY IMPORTANT HERE
                // since we've made Expenses class @observable, we can pass it into the AddView
                // in AddView, there is a var called expenses, which accepts Expenses as a type
                // therefore, passing the expenses here would create it and pass it to AddView
                AddView(expenses: expenses)
            }
        }
    }
    
    // Removes a list item in a list
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
}

#Preview {
    ContentView()
}
