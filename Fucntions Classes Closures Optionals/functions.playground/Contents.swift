import UIKit

// Basic function - doesn't take any parameters
func showWelcomeMsg() {
    print("Welcome!")
}

// Function - takes parameters
func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print(number*i)
    }
}

printTimesTables(number: 10, end: 5)
printTimesTables(number: 0, end: 10)

// How to return values from functions
func rollDice() -> Int {
    return Int.random(in: 1...6)
}

func rollXTimes(rolls: Int) {
    for roll in 1...rolls {
        print("Roll number \(roll), result is \(rollDice())")
    }
}

rollXTimes(rolls: 12)

func containSameLetters(firstString: String, secondString: String) -> Bool {
    if firstString.sorted() == secondString.sorted() {
        return true
    } else {
        return false
    }
}

// A cleaner way to coding the above - if there only 1 line of code and that line returns something, you don't need to write Return
func containSameLettersV2(firstString: String, secondString: String) -> Bool {
    firstString.sorted() == secondString.sorted()
}

containSameLetters(firstString: "lead", secondString: "deal") // works
containSameLettersV2(firstString: "lead", secondString: "deal") // works

// be lazy, write less code
func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a*a + b*b)
}

pythagoras(a: 3, b: 4) // worked
pythagoras(a: 5, b: 12) // worked

func rightOrWrong(judgement: Bool) {
    if judgement {
        print("Yay")
    } else {
        return // exits
    }
}

rightOrWrong(judgement: false) // this should return nothing - this function sucks but it's to illustrate a point

// Set default value for end: to 12
func printTimesTable(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTable(for: 5) // ends in 12, default
printTimesTable(for: 5, end: 13) // ends in 13
