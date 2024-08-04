//
//  SummaryView.swift
//  Spent.
//
//  Created by David Huang on 5/28/24.
//

import SwiftUI

struct SummaryView: View {
    @State private var expenses = Expenses()
    
    var body: some View {
        Text("Summary View")
    }
}

#Preview {
    SummaryView()
}
