import UIKit

//Being explicit about datatype to a constant or variable

let name: String = "Doe"
let luckyNumber: Int = 7
let pi: Double = 3.141
var isMale: Bool = true

var albums: [String] = ["After Hours", "103.5 Dawn FM"] //array
var user: [String: String] = ["id": "@admin"] //dictionary
var primeNumbers: Set<Int> = Set([ 1, 3, 5, 7, 11, 13 ]) //set

//Explicit type annotation allows you to change it late
//Use type inference as often as possible
enum textStyle {
    case header, subheader, body, caption
}

var bodyTextStyle = textStyle.header
bodyTextStyle = .caption

//Empty constant or variable
let username: String //empty, but we promise it will have a String value later
//some logic...
username = "user123"
// some logic
print(username)
