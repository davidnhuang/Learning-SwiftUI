//
//  ContentView.swift
//  Intro_ViewsAndModifiers
//
//  Created by David Huang on 3/1/24.
//

import SwiftUI

// You can create custom modifiers!
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.gray.gradient)
            .clipShape(.rect(cornerRadius: 12))
    }
}

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
    
    // You can create custom views, like components, that share the same modifiers
    struct LargePillText: View {
        var text: String
        
        var body: some View {
            // Custom modifier being used here
            Text(text)
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
                .titleStyle()
            VStack {
                ForEach(0..<sampleText.count) {
                    // Using LargePillText custom view
                    LargePillText(text: sampleText[$0])
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
            Color.yellow
                .frame(height: 100)
                .watermarked(with: "Made in Swift!")
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

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

// When you create custom modifers, it's a good idea to add it to the view extension
// this makes declaring it later easier
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
    
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

#Preview {
    ContentView()
}
