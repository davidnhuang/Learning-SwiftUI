import UIKit

func uselessFunction() {
    print("Nothing to see here")
}

var emptyVessel = uselessFunction // you can assign function to variable - variable type is : () -> Void
emptyVessel()

let sayHello = {
    print("Hi there!")
}

sayHello() // this is a closure

// closure syntax that takes parameters
let sayName = { (name: String) -> String in
    "Name is \(name)"
}
sayName("Bond")

let team = ["Betty", "Adam", "Charlie", "Zed"]
let sortedTeam = team.sorted()
print(sortedTeam)

func charlieFirstSorted(first: String, second: String) -> Bool {
    if first == "Charlie" {
        return true
    } else if second == "Charlie" {
        return false
    }
    
    return first < second
    
}

let leadFirstTeam = team.sorted(by: charlieFirstSorted)
print(leadFirstTeam)

// This below is the same as above, except with the closure fully written in
//let leadFirstTeam = team.sorted(by: { (first: String, second: String) -> Bool in
//    if first == "Charlie" {
//        return true
//    } else if second == "Charlie" {
//        return false
//    }
//
//    return first < second
//})
//
//print(leadFirstTeam)
