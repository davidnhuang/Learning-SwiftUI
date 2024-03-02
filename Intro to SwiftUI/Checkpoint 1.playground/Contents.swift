import UIKit

// VARIABLES
// create variable with var keyword
var name = "David"
// assign a variable a new value
name = "Jason"
// create a constant with let keyword
let color = "blue"
// you cannot assign a new value to constants
// user the print() function to show values in console
print(color)
// convention for naming variables is camelCase
var playerName = "David123"


// STRINGS
// create strings with ""
let quote = "To be or not to be."
var actor = "Daniel Day Lewis"
var message = "🙂Good Job!"
// include quotation marks inside strings
let citation = "Her and I quote, \"I believe I am right here\", your Honor."
// create a multi-line string
let stanza = """
Roses are read,
Violets of blue.
"""
// strings have useful functions built-in
let filename = "My first image.jpg"
let characterCount = filename.count
let filenameCapitalized = filename.uppercased()
let isFileJPG = filename.hasSuffix(".jpg")


// WHOLE NUMBERS/INTEGERS
// create a whole number with numbers only
var score = 10
let maximum = 10_000_000
// incriment or decrement
score += 1
score -= 2
// multiply and divide
score *= 2
score /= 2
// numbers have useful functions built-in as well
let amount = 120
amount.isMultiple(of: 3)


// DECIMAL NUMBERS/DOUBLES
var fraction = 2.0
// Doubles and integers variables cannot be operated together unless specified as the same type
var a = 1.2
var b = 3
a + Double(b)
// increment or decrement
fraction += 1.1
fraction -= 2.2
// multiple or divide
fraction *= a
fraction /= Double(b)


// BOOLEAN
var powerOn = true
var gameOver = false
// striking ! a boolean flips it
!powerOn
// booleans have useful functions built-in
gameOver.toggle()


// JOINING STRINGS/INTERPOLATION
let greeting = "Hello, "
var username = "David"
let welcomeMsg = greeting + username
print(welcomeMsg)
// interpolate different data types
var age = 28
let validationMsg = welcomeMsg + ". You are \(age) years old"
print (validationMsg)
// include operations inside a message
let c = 5
print("\(c) + \(c) is \(c + c)")


// CHECKPOINT 1
// create a constant holding any temperature in Celsius
// convert termpature to Fahrenheit (temp * 9)/5 + 32
// print the result in both C and F
var celsius = 32.0
let fahrenheit = (celsius*9)/5 + 32
print ("Currently it is \(celsius) degrees Celsius, which is \(fahrenheit) degrees Fahrenheit")
