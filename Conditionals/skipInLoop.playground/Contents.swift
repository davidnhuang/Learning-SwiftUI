import UIKit

// Continue - skip an item in a loop and move to the next item
let filenames = ["picture.jpg", "file.pdf", "install.dmg", "audio.wav"]

for filename in filenames {
    if filename.hasSuffix(".wav") == false {
        continue // skip and go next
    }
    
    print("Found audio: \(filename)")
}

// Break - skip an item and exit loop immediately
let firstNumber = 4
let secondNumber = 14
var multiples = Array<Int>() // empty int array

for i in 1...100_000 {
    // if the number is a multiple of both firstNumber and secondNumber
    if i.isMultiple(of: firstNumber) && i.isMultiple(of: secondNumber) {
        multiples.append(i) // add to emtpy array mutliples
        
        // If the number of items in multiples is 10, break and stop loop
        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)
