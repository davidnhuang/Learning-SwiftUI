//
//  CustomAnimationView.swift
//  IntroToAnimation
//
//  Created by David Huang on 3/16/24.
//

import SwiftUI

struct CustomAnimationView: View {
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
        .animation(
            .easeInOut(duration: 2)
                .delay(1)
                .repeatCount(3, autoreverses: true), // at the end, it must resolve at the state of app
            value: animationAmount
        )
    }
}

#Preview {
    CustomAnimationView()
}
