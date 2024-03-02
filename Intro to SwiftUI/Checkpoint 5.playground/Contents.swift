import UIKit

// CLOSURES
// passing a function to a variable so that you can call it
func newUserMsg() {
    print("Hello World")
}
var greetUser = newUserMsg
greetUser()
// however, you can do the same using closure, which does the above
let sayHello = {
    print("Hi there!")
}
sayHello()
// closures that accept parameters - there's no parameter label
let greetUser2 = { (name: String) -> String in
    "Hello \(name)"
}
greetUser2("David")
// another example - here we will pass a function
let team = ["Gloria", "Suzanne", "Piper", "Tiffany"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirst(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}
// let sortCaptainTeam = team.sorted(by: captainFirst)

// another way to do it is using closure
let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
})
print(captainFirstTeam)


// TRAILING CLOSURES AND SHORTHAND SYNTAX
// shorter and easier to read closures for the above
let simpleCptFirst = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
}
print(simpleCptFirst)
// using $ sintax to get the first and the second item
let reverseTeam = team.sorted { return $0 > $1 }
print(reverseTeam)
let reverseTeamLonger = team.sorted { first, second in
    return first > second
}
print(reverseTeamLonger)
// another example of closures
let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)
let tOnly_longer = team.filter { name in
    name.hasPrefix("T")
}
print(tOnly_longer)
let tOnly_longest = team.filter{ (name: String) -> Bool in
    name.hasPrefix("T")
}
print(tOnly_longest)
// closure allow us to execute blocks of code inside functions


// ACCEPTING FUNCTIONS AS PARAMETERS
// this function takes 2 parameters
// first is the size, which is an int, with parameter size
// second is a function, which accepts no paramters but returns int
// this whole function outputs an int array
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]() // create empty array
    
    for i in 0..<size {
        let newNumber = generator() // assign output of generator to newNumber
        numbers.append(newNumber)
    }
    
    return numbers
}

func generateNumber() -> Int {
    Int.random(in: 1...100)
}

let newRolls = makeArray(size: 10, using: generateNumber)
print(newRolls)
// you can accept multiple functions as parameters
func doWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first job")
    first()
    print("About to start second job")
    second()
    print("About to start third job")
    third()
    print("Jobs complete.")
}
// to call
doWork {
    // some work
    print("Job 1 done!")
} second: {
    // some work
    print("Job 2 done!")
} third: {
    // some work
    print("Job 3 done!")
}


// CHECKPOINT 5
// input luckNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
// you are to...
// filter out any even number
// then, sort array in ascending order
// map them to strings in the format of "7 is a lucky number"
// finally, print the resulting array, one item per line
let allNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

//let oddNumbers = allNumbers.filter { num in
//    num%2 != 0
//}
//
//let printOddNum = { (numbers: Array<Int>) -> Void in
//    for num in 0..<numbers.count {
//        print("\(numbers[num]) is a lucky number")
//    }
//}
// printOddNum
// shorter and better way to do it in the following
let luckNumbers = allNumbers.filter{ !$0.isMultiple(of: 2) }.sorted()
let printLuckyNum = { (list: Array<Int>) in
    for num in 0..<list.count {
        print("\(list[num]) is a lucky number")
    }
}
printLuckyNum(luckNumbers)
