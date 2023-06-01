import UIKit

// CHECKPOINT 4

// Write a function that accepts an integer from 1 through 10_000 and returns the integer root for that number
// If the number is less than 1 or greater than 10_000, throw an out of bounds error
// You should only consider integer square roots
// If you can't find the square root, throw a "no root" error

enum sqrtError: Error {
    case outOfBound, noRoot
}

func findSquareRoot(of number: Int) throws {
    
    if number < 1 || number > 10_000 {
        throw sqrtError.outOfBound
    }
    
    for root in 1...100 {
        if root * root == number {
            print ("The square root of \(number) is \(root)")
            break
        } else {
            if root == 100 {
                throw sqrtError.noRoot
            }
        }
    }
    
}

do {
    try findSquareRoot(of: 576)
} catch sqrtError.outOfBound {
    print("Out of bounds.")
} catch sqrtError.noRoot {
    print("No root.")
}
