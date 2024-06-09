//
//  InputView.swift
//  Spent.
//
//  Created by David Huang on 5/28/24.
//

import SwiftUI


struct InputView: View {
    
    @State private var presentPickerView = false
    @State private var amount = 0.0
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Go to summary") {
                    SummaryView()
                }
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                Button("Go to picker") {
                    presentPickerView = true
                }
            }
            .sheet(isPresented: $presentPickerView) {
                CategoryPicker()
            }
        }
        
    }
}

#Preview {
    InputView()
}
