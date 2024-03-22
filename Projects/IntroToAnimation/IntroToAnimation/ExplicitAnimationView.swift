//
//  ExplicitAnimationView.swift
//  IntroToAnimation
//
//  Created by David Huang on 3/17/24.
//

import SwiftUI

struct ExplicitAnimationView: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap Me") {
            withAnimation(.spring(duration: 1, bounce: 0.25)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(
            .degrees(animationAmount), axis: (x: 0, y: 1.0, z: 0.0)
        )
    }
}

#Preview {
    ExplicitAnimationView()
}
