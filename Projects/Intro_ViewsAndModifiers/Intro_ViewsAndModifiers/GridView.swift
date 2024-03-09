//
//  GridView.swift
//  Intro_ViewsAndModifiers
//
//  Created by David Huang on 3/4/24.
//

import SwiftUI

// Custom View Container
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    // Closure that accepts 2 Int and returns Content, a generic
    // @ViewBuilder attribute automatically creates an HStack
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id:\.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct GridView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
        }
    }
}

#Preview {
    GridView()
}
