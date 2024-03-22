//
//  ContentView.swift
//  IntroToGestures
//
//  Created by David Huang on 3/20/24.
//

import SwiftUI

struct ContentView: View {
    @State private var dragAmount = CGSize.zero

    var body: some View {
        
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 300)
            .clipShape(.rect(cornerRadius: 12))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged{ dragAmount = $0.translation }
                    .onEnded {
                        _ in
                        // explicit animation to onEnd
                        withAnimation(.bouncy) {
                            dragAmount = .zero
                        }
                    }
            )
            // .animation(.bouncy, value: dragAmount) <- implicit animation
    }
}

#Preview {
    ContentView()
}
