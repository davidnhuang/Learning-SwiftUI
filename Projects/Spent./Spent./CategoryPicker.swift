//
//  CategoryPicker.swift
//  Spent.
//
//  Created by David Huang on 5/6/24.
//

import SwiftUI

struct CategoryPicker: View {
    @Environment(\.dismiss) var dismiss
    
    let categories = ["Dining", "Beverages", "Entertainment", "Medical", "Emergency", "Other"]
    
    @State private var date = Date.now
    var inputAmount: String
    
    var body: some View {
        Text(inputAmount)
        
        Button("Save") {
            dismiss()
        }
    }
}

#Preview {
    CategoryPicker(inputAmount: "2.0")
}
