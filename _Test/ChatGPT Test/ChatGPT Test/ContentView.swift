//
//  ContentView.swift
//  ChatGPT Test
//
//  Created by David N. Huang on 4/15/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Page1View()) {
                    Text("Page 1")
                }
                NavigationLink(destination: Page2View()) {
                    Text("Page 2")
                }
                NavigationLink(destination: Page3View()) {
                    Text("Page 3")
                }
                NavigationLink(destination: Page4View()) {
                    Text("Page 4")
                }
            }
            .navigationTitle("Hi")
        }
    }
}

struct Page1View: View {
    var body: some View {
        Text("Page 1")
    }
}

struct Page2View: View {
    var body: some View {
        Text("Page 2")
    }
}

struct Page3View: View {
    var body: some View {
        Text("Page 3")
    }
}

struct Page4View: View {
    var body: some View {
        Text("Page 4")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
