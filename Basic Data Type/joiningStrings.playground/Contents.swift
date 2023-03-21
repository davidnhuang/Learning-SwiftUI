import UIKit

//Joining strings
let subject = "The man "
let verb = "ran"
let sentence = subject + verb //Can only join up to 2 strings
print(sentence)

//String interpolation
let customerName = "David"
let currentTime = "Good Afternoon"
let welcomeMsg = "\(currentTime), \(customerName)"
print(welcomeMsg)

var age = 15
var childName = "Jeremy"
let introduction = "Hello everyone. My name is \(childName), and I am \(age) years old."

let a = 2
let b = 3
print("\(a) plus \(b) equals \(a+b)")
