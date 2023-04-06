import UIKit

let platforms = ["iOS", "macOS", "iPadOS", "tvOS", "watchOS"]
var nestedLoopOn = false

// iterate through an array - os is the loop variable
for os in platforms {
    print("Swift works for \(os)")
}

// iterate through a range
for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

// nested for loop - wrapped an if loop so I can toggle it on or off
if nestedLoopOn {
    for i in 1...12 {
        print("The \(i) times table")
        
        for j in 1...12 {
            print("   \(j) x \(i) is \(j * i)")
        }
    }
}

for i in 1...5 {
    print("Coutning from 1 through 5: \(i)")
}

for i in 1..<5 {
    print("Counting from 1 up to 5 : \(i)")
}

// If you won't be referencing or using the loop variable
for _ in 1...3 {
    print("yeah")
} // this will print yeah 3 times
