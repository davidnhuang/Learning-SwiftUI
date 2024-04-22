//
//  UserDefaultView.swift
//  iExpense
//
//  Created by David Huang on 4/22/24.
//

import SwiftUI

struct UserDefaultView: View {
    // User default is the best way to store small amounts of data
    // Perfect for storing recency - like last viewed, or last tapped
    // Access this using app storage
    
    // This data will now persist! Even when you background the app
    // @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    // With app storage, data will persist even after killing the app!
    // With @AppStorage, you can set a default value!
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap count of \(tapCount)") {
            tapCount += 1
            
            // 3 things happening
            // Use built-in userdefaults with standard
            // set accepts a wide variety of data
            // attach a string name that is case sensitive
            // UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
    }
}

#Preview {
    UserDefaultView()
}
