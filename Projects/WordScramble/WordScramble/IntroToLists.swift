//
//  IntroToLists.swift
//  WordScramble
//
//  Created by David Huang on 3/11/24.
//

import SwiftUI

struct IntroToLists: View {
    var body: some View {
        VStack {
            // List of static content
            List {
                Section("Section 1") {
                    Text("Static Row 1")
                    Text("Static Row 2")
                }
                Section("Section 2") {
                    ForEach(0..<10) {
                        Text("List item \($0)")
                    }
                }
                Section("Section 3") {
                    Text("Static Row 1")
                }
            }
            .listStyle(.grouped)
            
            // List of Dynamic content
            List(0..<5) {
                Text("Dynamic Row \($0)")
            }
        }
    }
}

#Preview {
    IntroToLists()
}
