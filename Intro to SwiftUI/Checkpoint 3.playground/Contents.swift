import UIKit
// IF STATEMENTS
// check conditions and execute code using if else loop
enum lightColor {
    case green, orange, red
}
var light = lightColor.red
if light == .green {
    print("Go")
} else {
    print("Stop")
}

var score = 0
if score >= 10 {
    // some code
    print("Won in Catan")
} else {
    //some code
    print("Game in progress...")
}

let name1 = "Chloe Dorochokva"
let name2 = "Daniella Von Konstantine"
if name1 > name2 {
    print("\(name1) comes after \(name2)")
} else {
    print("\(name1) comes before \(name2)")
}

var numbers = [1,2,3]
if numbers.count < 5 {
    numbers.append(6)
} else {
    print("Done")
}

var username = ""
if username.isEmpty {
    // some code
    print("Username cannot be empty.")
} else {
    print("Username is \(username)")
}

// check if a condition is not
var blocker = true
if blocker != true {
    // do something
    print("Unblocked")
} else {
    print("Blocked")
}
// check multiple conditions
var legs = 4
var canBark = true
if legs == 4 && canBark {
    print("It's a dog!")
} else if legs == 4 && !canBark {
    print("It has \(legs) legs.")
} else {
    print("Not sure")
}

// you can nest if statements
let temperature = 10
if temperature > 20 {
    if temperature > 30 {
        print("It's too hot.")
    } else {
        print("It's nice outside!")
    }
} else {
    if temperature < 18 {
        print("It's cold")
    } else {
        print("It's a bit chilly")
    }
}

// check if one condition or another is true
let childAge = 17
let parentalConsent = true
if childAge > 16 || parentalConsent {
    print("Can enter theme park")
} else {
    print("Cannot enter theme park")
}

enum transportationOption {
    case walk, bike, car, transit, airplane
}

var selectedTransportOption = transportationOption.bike

if selectedTransportOption == .airplane {
    // something
    print("Finding nearest airport...")
} else if selectedTransportOption == .car || selectedTransportOption == .transit {
    print("Calculating travel time...")
} else if selectedTransportOption == .bike {
    print("Avoiding hills...")
} else if selectedTransportOption == .walk {
    print("Finding best time to walk...")
} else {
    print("Unknown transport method.")
}


// SWITCH STATEMENTS
// checks multiple conditions
enum weatherTypes {
    case sunny, raining, windy, snowing, unknown
}
let weatherForcast = weatherTypes.raining
switch weatherForcast {
case .sunny:
    //something
    print("Sunny day")
case .raining:
    // something
    print("It's raining")
case .windy:
    // something
    print("It's windy")
case .snowing:
    // something
    print("It's snowing!")
case .unknown:
    print("Weather anomaly")
}
// another example
var dayOfChristmas = 2
print("On the \(dayOfChristmas) day of Christmas my true love gave to me ...")
switch dayOfChristmas {
case 3:
    print("Three French hens,")
    fallthrough // also execute the following case
case 2:
    print("Two turtle doves,")
    fallthrough
case 1:
    if dayOfChristmas != 1 {
        print("And a partridge in a pear tree.")
    } else {
        print("A partridge in a pear tree.")
    }
default:
    print("Merry Christmas")
}


// TERNARY
// quick condition tests in a single line
let citizenAge = 18
// canVote returns 2 possible outputs, one which is true and one which is false
let canVote = citizenAge >= 18 ? true : false
// format - condition ? true output : false output
var authToken = "1234"
// have to use Any since there is a function print() that is being stored in a constant
let hasAuth: Any = authToken == "12345" ? print("Logging in...") : print("Access denied.")
// another example
enum theme {
    case light, dark
}
let selectedTheme = theme.dark
let backgroundColor = selectedTheme == .light ? "#ffffff" : "#000000"


// FOR LOOP
// iterate through a set of items or number
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]
for os in platforms {
    print("Swift works great on \(os)")
}
// another example - this will loop 5 times, starting from 1
let loopLimit = 10
for i in 1...loopLimit {
    print("Iteration \(i)")
}
// another example - this will exclude the last
for i in 1..<10 {
    print("This will print \(10-1) times")
}


// WHILE LOOP
// run until a condition is satisfied - you don't know how many iterations to run
var countdown = 10
while countdown > 0 {
    print ("\(countdown)")
    countdown -= 1
}
print("Blast off!")
// another example
var diceRoll = 0
while diceRoll != 5 {
    diceRoll = Int.random(in: 1...5)
    print("You rolled \(diceRoll)!")
}
print("You win!")


// SKIP LOOP ITEMS
// continue and break keyword - continue skips to the next, break ends the remainder
let filenames = ["me.jpg", "work.txt", "sophie.jpg"]
for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        // skipping the item that doesn't have .jpg as suffix
        continue
    }
    print("Found picture: \(filename)")
}
// another example using break - exit out of the loop
let number1 = 4
let number2 = 14
var commonMultiples = [Int]()
for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        commonMultiples.append(i)
    }
    if commonMultiples.count == 10 {
        // break out of loop
        break
    }
}
print (commonMultiples)


// CHECKPOINT 3
// loop from 1 through 100, for each number:
// if it's a multiple of 3, print fizz
// if it's a multiple of 5, print buzz
// if it's a multiple of both, print fizzbuzz
// if else, print the number
for i in 1...40 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("FizzBuzz")
    } else if i.isMultiple(of: 3) {
        print("Fizz")
    } else if i.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(i)
    }
}
