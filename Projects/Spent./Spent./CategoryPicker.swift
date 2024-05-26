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
    
    var body: some View {
        VStack {
            Spacer()
            Text("Spent $0.00 on ...")
            Spacer()
            ForEach(categories, id:\.self) { category in
                HStack {
                    Text(category)
                    Spacer()
                    Text("$0.00")
                }
            }
            .padding(8)
            Spacer()
            Button("Submit", systemImage: "checkmark") {
                // save entry
                print("submitted")
                dismiss()
            }
            .labelStyle(.iconOnly)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    CategoryPicker()
}
