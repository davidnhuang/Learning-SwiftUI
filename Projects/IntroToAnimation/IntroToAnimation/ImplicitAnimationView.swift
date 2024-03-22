//
//  ImplicitAnimationView.swift
//  IntroToAnimation
//
//  Created by David Huang on 3/16/24.
//

import SwiftUI

struct ImplicitAnimationView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(8)
        .background(.thickMaterial)
        .foregroundColor(.black)
        .clipShape(.capsule)
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount-1)*3)
        .animation(.default, value: animationAmount) // let Swift handle the animation
    }
}

#Preview {
    ImplicitAnimationView()
}
