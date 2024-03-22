//
//  AnimationStackView.swift
//  IntroToAnimation
//
//  Created by David Huang on 3/18/24.
//

import SwiftUI

struct AnimationStackView: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap me") {
            enabled.toggle()
        }
        .frame(width: 100, height: 100)
        .background(enabled ? .blue : .red)
        .foregroundStyle(.white)
        .animation(nil, value: enabled)
        // Modifier order matters, only modifiers before animation gets animated!
        .clipShape(.rect(cornerRadius: enabled ? 16 : 0))
        .animation(.spring(duration: 1, bounce: 0.5), value: enabled)
    }
}

#Preview {
    AnimationStackView()
}
