//
//  ShowHideTransition.swift
//  IntroToGestures
//
//  Created by David Huang on 3/21/24.
//

import SwiftUI

struct ShowHideTransition: View {
    @State private var isShowingRed = false
    
    var body: some View {
        Button("Tap me") {
            withAnimation {
                withAnimation {
                    isShowingRed.toggle()

                }
            }
        }
        
        if isShowingRed {
            Rectangle()
                .fill(.red)
                .frame(width: 100, height: 100)
                .transition(.asymmetric(insertion: .scale, removal: .opacity)) // type of animation
        }
        
    }
}

#Preview {
    ShowHideTransition()
}
