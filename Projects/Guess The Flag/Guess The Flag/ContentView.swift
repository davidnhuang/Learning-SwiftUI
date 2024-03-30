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
    
    // Animation Properties
    @State private var selectedFlag = 0
    @State private var animationAmount = 0.0
    @State private var animateOpacity = 1.0
    @State private var animateIncorrectAnswers = false
    @State private var animateOtherAnswers = false
    
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
                    // Identify selected button in ForEach
                    self.selectedFlag = number
                    // Tap Flag
                    self.flagTapped(number)
                    
                } label: {
                    FlagView(country: countries[number])
                }
                // animate correct answer
                .rotation3DEffect(
                    .degrees(number == self.correctAnswer ? self.animationAmount : 0),
                    axis: (x: 0, y: 1, z: 0)
                )
                // scale down
                .scaleEffect(
                    CGSize(
                        width: number != self.correctAnswer && animateIncorrectAnswers ? 0.85 : 1,
                        height: number != self.correctAnswer && animateIncorrectAnswers ? 0.85 : 1
                    )
                )
                // animate incorrect answer
                // scale down
                .scaleEffect(
                    CGSize(
                        width: number != self.correctAnswer && animateOtherAnswers ? 0.85 : 1,
                        height: number != self.correctAnswer && animateOtherAnswers ? 0.85 : 1
                    )
                )
                .opacity(
                    number != self.correctAnswer && animateOtherAnswers ? 0.5 : 1
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
        if number == correctAnswer {
            scoreTitle = "Correct ✅"
            score += 1
            scoreMessage = "Your current streak is \(score)"
            
            // Create animation for correct answer
            withAnimation {
                self.animationAmount += 360
                self.animateOpacity = 0.25
                self.animateIncorrectAnswers = true // only animates after tap
            }
            
        } else {
            scoreTitle = "Wrong ❌"
            scoreMessage = "That is the flag for \(countries[number]). Your streak was \(score)"
            score = 0
            
            // Create animation for incorrect answer
            withAnimation {
                self.animationAmount = 0.25
                self.animateOtherAnswers = true // only animates after tap
            }
        }
        
        showingScore = true
    }
    
    func resetRound() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        //Reset animation states
        selectedFlag = 0
        animationAmount = 0.0
        animateOpacity = 1.0
        animateIncorrectAnswers = false
        animateOtherAnswers = false
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
