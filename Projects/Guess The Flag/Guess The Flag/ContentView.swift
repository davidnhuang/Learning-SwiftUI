//
//  ContentView.swift
//  Guess The Flag
//
//  Created by David Huang on 2/29/24.
//

import SwiftUI

struct ContentView: View {
    // Randomized list of countries
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var scoreMessage = ""
    @State private var animationAmount = 0.0
    
    var body: some View {
        //Main
        VStack(spacing: 30) {
            //Title
            Text("Guess the Flag")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color.white)
            // Prompt
            // 2 Text views stacked vertically
            // Picks randomly among the first 3 countries
            VStack {
                Text("Tap the flag of")
                    .foregroundStyle(Color.white)
                Text(countries[correctAnswer])
                    .font(.title2)
                    .padding(8)
                    .background(.thinMaterial)
                    .cornerRadius(12)
            }
            
            Spacer()
            // Flag View
            // Loops through first 3 countries and displays the flag image view inside the button
            ForEach(0..<3) { number in
                Button {
                    // Tap Flag
                    flagTapped(number)
                } label: {
                    FlagView(country: countries[number])
                }
                .rotation3DEffect(
                    .degrees(animationAmount), axis: (x: 0, y: 1.0, z: 0.0)
                )
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 40)
        .padding(.bottom, 32)
        .background(Color.blue.gradient)
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: resetRound)
        } message: {
            Text(scoreMessage)
        }
       
    }
    
    // Functions
    func flagTapped(_ number: Int) {
        withAnimation(.spring(duration: 1, bounce: 0.25)) {
            animationAmount += 360
        }
        
        if number == correctAnswer {
            scoreTitle = "Correct ✅"
            score += 1
            scoreMessage = "Your current streak is \(score)"
        } else {
            scoreTitle = "Wrong ❌"
            scoreMessage = "That is the flag for \(countries[number]). Your streak was \(score)"
            score = 0
        }
        
        showingScore = true
    }
    
    func resetRound() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

struct FlagView: View {
    var country: String
    var body: some View {
        Image(country)
            .cornerRadius(12)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, y: 8)
    }
}


#Preview {
    ContentView().preferredColorScheme(.dark)
}
