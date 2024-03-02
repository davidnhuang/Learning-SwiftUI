import UIKit

// FUNCTIONS
// functions allow you to reuse code
func showWelcome() {
    print("""
    Welcome to my app!
    By default this prints out a conversion
    chart from centimeters to inches, but you
    can also set a custom range if you want.
    """)
}
showWelcome()
// another example
func multiplicationTable(number: Int) {
    for i in 1...10 {
        print("\(number) x \(i) = \(number*i)")
    }
}
multiplicationTable(number: 4)
// another example
func square(_ number: Int) {
    print(number*number)
}
square(81)
// another example
func compareNumbers(first: Int, second: Int) {
    if first > second {
        print("\(first) is greater than \(second)")
    } else if first < second {
        print("\(first) is less than \(second)")
    } else if first == second {
        print("Both numbers are the same")
    }
}
compareNumbers(first: 2, second: 4)
compareNumbers(first: 29, second: 28)
compareNumbers(first: 19, second: 19)


// RETURN VALUES IN FUNC
// here's how to return value in a function; the -> indicates the type of data the function will return
func rollDice() -> Int {
    return Int.random(in: 1...6)
}
let roll = rollDice()
print(roll)
// another example : do 2 strings contain the same letters, regardless of order?
// so, this func will return a boolean
func checkLetters(firstWord: String, secondWord: String) -> Bool {
    if firstWord.lowercased().sorted() == secondWord.lowercased().sorted() {
        return true
    } else {
        return false
    }
}
checkLetters(firstWord: "MAD", secondWord: "dam")
// better cleaner way to do this - notice that we don't need to write return since it's single line and only returns 1 value
func checkLets(first: String, second: String) -> Bool {
    first.lowercased().sorted() == second.lowercased().sorted()
}
checkLets(first: "MAD", second: "dam")
// another example
func pythagorean(a: Double, b: Double) -> Double {
    sqrt( a*a + b*b )
}
pythagorean(a: 3, b: 4)
// you can force a function to exit immediately with an empty return
func sayHello() {
    return
}


// RETURN MULTIPLE VALUES
// swift uses Tuples to return multiple values
func calculations(firstInt: Int, secondInt: Int) -> (add: Int, multiply: Int) {
    (add: firstInt + secondInt, multiply: firstInt * secondInt)
}
print(calculations(firstInt: 2, secondInt: 5))
// another example
func threeCalc(firstNum: Int, secondNum: Int) -> (add: Int, multiply: Int, divide: Int) {
    (add: firstNum + secondNum, multiply: firstNum * secondNum, divide: firstNum / secondNum)
}
print(threeCalc(firstNum: 4, secondNum: 2))
let (add, multiply, divide) = threeCalc(firstNum: 12, secondNum: 4)
print("\(add), \(multiply), \(divide)")


// CUSTOMIZING PARAMETER LABELS
// use _ to remove the need to type out the parameter label
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}
let checkString = isUppercase("USER")
// have a custom parameter label externally
// for in the parameter improves legibility
func printTable(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) = \(i*number)")
    }
}
printTable(for: 2)


// SET DEFAULT VALUE FOR PARAMETERS
func printTimesTables(for number: Int, end: Int = 10) {
    for i in 1...end {
        print("\(i) x \(number) = \(i * number)")
    }
}
printTimesTables(for: 2)
printTimesTables(for: 1, end: 2)


// ERROR HANDLING IN FUNCTIONS
enum passwordErrorTypes: Error {
    case short, obvious
}
func checkPasswordStrength(_ password: String) throws -> String {
    if password.count <= 5 {
        throw passwordErrorTypes.short
    }
    if password.contains("password") || password.contains("12345") {
        throw passwordErrorTypes.obvious
    }
    if password.count < 5 {
        return "Ok"
    } else if password.count < 10 {
        return "Good"
    }
    else {
        return "Strong"
    }
}
// You need to write throwing functions like the following
do {
    let check = try checkPasswordStrength("1802938")
    print("Password is \(check)")
} catch passwordErrorTypes.short {
    print("Password is too short")
} catch passwordErrorTypes.obvious {
    print("Password is too obvious")
}catch {
    print("Something went wrong.")
}


// CHECKPOINT 4
// write a function that...
// accepts an integer from 1 through 10,000
// and returns the integer square root of that number
// if the number is less than 1 or greater than 10,000, throw "out of bounds" error.
enum numberEntryError: Error {
    case outOfBounds, noRoot
}
func findSquareRoot(for number: Int) throws -> Int {
    if number < 1 || number > 10_000 {
        throw numberEntryError.outOfBounds
    }
    for i in 1...100 {
        if i*i == number {
            return i
        } else if i == 100 && i*i != number {
            throw numberEntryError.noRoot
        }
    }
    return 0 // need this for some reason 🤷
}
do {
    try findSquareRoot(for: 10_000)
} catch numberEntryError.outOfBounds {
    print("Out of bounds")
} catch numberEntryError.noRoot {
    print("No root found.")
} catch {
    print("Error occured")
}
