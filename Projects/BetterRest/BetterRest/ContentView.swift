//
//  ContentView.swift
//  BetterRest
//
//  Created by David Huang on 3/6/24.
//  Calculate:
//  1. When someone wants to wake up
//  2. How much sleep they like
//  3. How much coffee to drink

import CoreML
import SwiftUI

struct ContentView: View {
    // Starting States
    @State private var preferredWakeUpTime = defaultWakeTime
    @State private var preferredSleepAmount = 8.0
    @State private var coffeeAmount = 1
    
//    @State private var alertTitle = ""
//    @State private var alertMsg = ""
//    @State private var showAlert = false
    
    var sleepResult: String {
        do {
            // Instance of ML
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            // To feed to ML
            let components = Calendar.current.dateComponents([.hour, .minute], from: preferredWakeUpTime)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            // ML
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: preferredSleepAmount, coffee: Double(coffeeAmount))
            
            // DISPLAY
            // Sleep time is predicted in the format of time
            // The sleep time amount is calculated by subtracting the two different times
            let sleepTime = preferredWakeUpTime - prediction.actualSleep
            return "\(sleepTime.formatted(date: .omitted, time: .shortened))"
        } catch {
            return "Something Went Wrong"
        }
    }
    
    // static keyword is required because
    // it belongs to the struct and read whenever we want
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("When would you like to wake up?") {
                    DatePicker("Wake up at", selection: $preferredWakeUpTime, displayedComponents: .hourAndMinute)
                }
                
                // Set preferred sleep amount
                Section("How long would you like to sleep?") {
                    Stepper("\(preferredSleepAmount.formatted()) hours", value: $preferredSleepAmount, in: 4...12, step: 0.5)
                }
                
                // Coffe calculation
                Section("Caffeine") {
                    Picker("Cups of coffee", selection: $coffeeAmount) {
                        ForEach(1..<5) {
                            Text("^[\($0) cup](inflect: true)")
                        }
                    }
                    .pickerStyle(.palette)
                }
                Section("Recommended sleep time") {
                    Text(sleepResult)
                        .font(.title3)
                }
            }
            .navigationTitle("BetterRest")
        }
    }
    
//    func calculateBedTime() {
//        do {
//            // Instance of ML
//            let config = MLModelConfiguration()
//            let model = try SleepCalculator(configuration: config)
//            
//            // To feed to ML
//            let components = Calendar.current.dateComponents([.hour, .minute], from: preferredWakeUpTime)
//            let hour = (components.hour ?? 0) * 60 * 60
//            let minute = (components.minute ?? 0) * 60
//            
//            // ML
//            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: preferredSleepAmount, coffee: Double(coffeeAmount))
//            
//            // DISPLAY
//            // Sleep time is predicted in the format of time
//            // The sleep time amount is calculated by subtracting the two different times
//            let sleepTime = preferredWakeUpTime - prediction.actualSleep
//            alertTitle = "Ideal bedtime is \(sleepTime.formatted(date: .omitted, time: .shortened))"
//            alertMsg = "Sleep time calculated using machine learning!"
//        } catch {
//            alertTitle = "Something Went Wrong"
//            alertMsg = "The app was not able to calculate. Please try again."
//        }
//        
//        showAlert = true
//    }
}

#Preview {
    ContentView().preferredColorScheme(.dark)
}
