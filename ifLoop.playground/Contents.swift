import UIKit

let score = 85

if score > 80 {
    print("You win!")
}

let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("Going fast")
}

if percentage < 85 {
    print("Not proficient")
}

if age >= 18 {
    print("You can vote.")
}

let name1 = "Zach"
let friendName = "John"

if name1 < friendName {
    print("It's \(name1) vs \(friendName)")
}

if name1 > friendName {
    print("It's \(friendName) vs \(name1)")
}

var numbers = [1, 2, 3]
numbers.append(4)

if numbers.count > 3 {
    numbers.remove(at: 0)
    print(numbers)
}

let country = "USA"

if country == "France" {
    print("Bonjour")
}

var userID = "@admin"

if userID != "@new" {
    print("Welcome back")
}

if userID.isEmpty {
    userID = "PlaceholderID"
}

