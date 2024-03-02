//
//  ContentView.swift
//  Intro_ViewsAndModifiers
//
//  Created by David Huang on 3/1/24.
//

import SwiftUI

// Why does SwiftUI use structs instead of class?
// 1. Structs are more performant
// 2. Structs are isolated. States are isolated to the view you are working on
// 3. Unlike classes which can have a ton of inherited properties, structs are cleaner
struct ContentView: View {
    
    @State private var useYellowText = false
    
    let sampleText = ["Welcome", "SwiftUI is fun!", "Keep learning!"]
    // You can have views stored in properties
    let phraseFirst = Text("Lorem Ipsum")
    let phraseSecond = Text("Placeholder text")
    var nestedView: some View {
        Section {
            Text("List Row 1")
            Text("List Row 2")
        }
        
    }
    
    // Some view is opaque type
    // We don't need to know what type of View, SwiftUI figures it out
    // the acutual View type can be found with print(type(of: ...))
    //    which includes all the views inside the var body
    var body: some View {
        // All that exists in this view is the vstack
        // There is nothing behind the view - the vstack is all you have
        // the rest is empty
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
            Text("Hello, world!")
            VStack {
                ForEach(0..<sampleText.count) {
                    Text(sampleText[$0])
                }
                phraseFirst
                    .font(.body)
                phraseSecond
                    .font(.body)
            }
            // Environment modifier applies to all the elements inside
            // Child modifiers will override the environment modifier
            .font(.title)
            
            nestedView
        }
        // Modifier order matters!
        // Best way to remember is that swift renders things one at a time
        // If you render the background color before the frame, Swift will paint it red, but not render it with the frame modifier
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue.gradient)
        // Conditional Modifiers
        // Using it with ternary
        // forgroundColor will be red is useRedText is true, white if false
        // this is more efficient and performant
        .foregroundColor(useYellowText ? .yellow : .white)
    }
}

#Preview {
    ContentView()
}
