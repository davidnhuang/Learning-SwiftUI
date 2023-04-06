import UIKit

// loop from 1 through 100, for each number
//  if it's a multiple of 3, print "Fizz"
//  if it's a multiple of 5, print "Buzz"
//  if it is a multiple of both, print "FizzBuzz"
//  for everything else, just print the number

// Firt try - worked
//for i in 1...100 {
//    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
//        print("FizzBuzz")
//    } else if i.isMultiple(of: 3) && i.isMultiple(of: 5) == false {
//        print("Fizz")
//    } else if i.isMultiple(of: 5) && i.isMultiple(of: 3) == false {
//        print("Buzz")
//    }
//    else {
//        print(i)
//    }
//}

// Second try - a bit cleaner
for i in 1...100 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("FizzBuzz")
    }
    else {
        if i.isMultiple(of: 3) {
            print("Fizz")
        } else if i.isMultiple(of: 5){
            print("Buzz")
        } else {
            print(i)
        }
    }
}
