//
//  ContentView.swift
//  Spent.
//
//  Created by David Huang on 4/29/24.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let category: String
    let amount: Double
    let date: Date
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
        
        // If all fails, array is empty
        items = []
    }
}

struct ContentView: View {
    var body: some View {
        InputView()
    }
}

#Preview {
    ContentView()
}
