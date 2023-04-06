import UIKit

let age = 18
let canVote = age >= 18 ? true : false //check if age is greater or equal to 18. If it is, return yes and assign it to canVote, if not, assign false to canVote

// a condense if else code
// what we checking, true output, false output


let hour = 23
print(hour < 12 ? "Before noon" : "After noon")

let roleCall = ["Jane", "Kate", "Mike"]
let crewCount = roleCall.isEmpty ? "No one" : "Crew members are \(roleCall[0]), \(roleCall[1]), and \(roleCall[2])"

enum Theme {
    case light, dark
}

let currentTheme = Theme.light
let background = currentTheme == .dark ? "#000000" : "#FFFFFF"

