//
//  InputView.swift
//  Spent.
//
//  Created by David Huang on 5/28/24.
//

import SwiftUI


struct InputView: View {
    
    @State private var presentPickerView = false
    @State private var presentSummaryView = false
    @State private var amount = 0.0
    
    var body: some View {
        VStack {
            TextField("Amount", value: $amount, format: .currency(code: "USD"))
            Button(amount == 0.0 ? "Spent" : "Spent \(amount) on ...") {
                if amount == 0.0 {
                    presentSummaryView = true
                } else {
                    presentPickerView = true
                }
            }
        }
        .sheet(isPresented: $presentPickerView) {
            CategoryPicker(inputAmount: String(amount))
        }
        .sheet(isPresented: $presentSummaryView) {
            SummaryView()
        }
    }
}

#Preview {
    InputView()
}
