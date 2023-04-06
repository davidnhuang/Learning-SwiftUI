import UIKit

// runs code until a condition is no longer true
// less common - usually we use for loops

var countdown = 10
let whileLoopOn = false

// && means and
while countdown > 0 && whileLoopOn {
    print("\(countdown)...")
    countdown -= 1 //make sure you have a way stop the loop
}

print ("Blast Off") // this code will not run until the previous while loop is done.

let id = Int.random(in: 1...100) // picks a random integar from 1 to 100 and assign it to id
let amount = Double.random(in: 0...1)

var roll = 0

// While loops are used when you don't know when a condition will be met
while roll != 20 {
    roll = Int.random(in: 1...20)
    print("Rolled a \(roll)")
}

print ("Critical Hit!")
