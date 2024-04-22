//
//  LearningArchiving.swift
//  iExpense
//
//  Created by David Huang on 4/22/24.
//

import SwiftUI

// Codable allows swift to convert objects into plain text and back
struct User: Codable {
    let firstName: String
    let lastName: String
}

struct LearningArchiving: View {
    @State private var user = User(firstName: "David", lastName: "Huang")
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
            
        }
    }
}

#Preview {
    LearningArchiving()
}
