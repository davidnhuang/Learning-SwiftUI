//
//  AnimatingOverlayView.swift
//  IntroToAnimation
//
//  Created by David Huang on 3/16/24.
//

import SwiftUI

struct AnimatingOverlayView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") { }
            .padding(8)
            .background(.thickMaterial)
            .foregroundColor(.black)
            .clipShape(.capsule)
            .overlay(
                Capsule()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount) // 1 being 100%
                    .animation(
                        .easeInOut(duration: 2)
                            .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
            )
            .onAppear {
                animationAmount = 2
            }
    }
}

#Preview {
    AnimatingOverlayView()
}
