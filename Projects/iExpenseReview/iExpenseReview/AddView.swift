//
//  AddView.swift
//  iExpenseReview
//
//  Created by David Huang on 5/25/24.
//

import SwiftUI

struct AddView: View {
    // Dismiss logic
    @Environment(\.dismiss) var dismiss
    
    // binding var that would be applied to the Observable Expenses class
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    var expenses: Expenses
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add Amount")
            .toolbar{
                Button("Save", systemImage: "checkmark") {
                    // REALLY IMPORTANT HERE
                    // we are creating item to save, which has the structure of Expense Item, created in ContentView
                    // we assign each property with what we've entered at the top using this form
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    // Once assign is complete, we append that newly created item to expenses, which has an array of ExpenseItem type
                    expenses.items.append(item)
                    // By using observable classes, data and structs are shared across views
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
