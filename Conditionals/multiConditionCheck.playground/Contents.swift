import UIKit

let age = 16
var canVote = false

if age >= 18 {
    canVote = true
} else {
    canVote = false
}

let scenario = "a"

if scenario == "a" {
    print("protocol 1")
} else if scenario == "b" {
    print("protocol 2")
} else {
    print("No protocol")
}

let temperature = 25
let isRaining = false

if temperature > 20 {
    if isRaining {
        print("Don't go out")
    } else {
        print("Go for a walk!")
    }
}

// The above code can be written as follows - && combines 2 checks
if temperature > 20 && isRaining != true {
    print ("Go for a walk")
} else {
    print("Don't go out")
}

// || means or
let userAge = 15
let hasParentConsent = false

if userAge >= 18 || hasParentConsent {
    print("Can purchase")
} else {
    print("Cannot purchase")
}

enum transportMethod {
    case airplane, car, bicycle, walk
}

var totalDistance = 200 //miles
var userSelectedTransportMethod = transportMethod.airplane

if userSelectedTransportMethod == .walk || userSelectedTransportMethod == .bicycle {
    if totalDistance <= 5 {
        print("You should walk or bike")
    } else {
        print("You should drive.")
        userSelectedTransportMethod = transportMethod.car
    }
} else {
    print("Safe trip.")
}
