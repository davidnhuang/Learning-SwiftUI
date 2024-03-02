import UIKit

// OPTIONALS
// might or might not have value
let opposites = [
    "Mario":"Wario",
    "Luigi": "Waluigi"
]
// unwrapping optionals
// if marioOpposite has value
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}
// another example
var username: String? = nil
// handles case of if there is a value or not
if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("Empty.")
}
// different states
var num1 = 1_000 // is 1000
var num2 = 0 // is 0
var num3: Int? = nil // might not be there

var str1 = "Hi!" // filled
var str2 = "" // empty
var str3: String? = nil // mignt not be there

var arr1 = [1,2] // filled
var arr2 = [Int]() // empty
var arr3: [Int]? = nil // might not be there
// another example
func square(number: Int) -> Int {
    number * number
}
var number: Int? = nil
// unwrap
if let unwrappedNum = number {
    print(square(number: unwrappedNum))
} else {
    print("Empty")
}


// GUARD LET
// if let runs if there is a value inside
// guard let ... else runs when it doesn't have a value inside.

// Swift requres you to use return if a guard check fails, or bailout
// if the optional you're unwrapping has value, you can use it after the guard code finishes
func printSquare(of number: Int?) {
    // check if optional has value - ensures that there are values
    guard let number = number else {
        print("Missing number")
        return
    }
    // execute
    print("\(number) squared is \(number*number)")
}


// NIL COALESCING
// really useful - unwrap, if empty it provides default value, if filled use filled value
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

// Another example
// if there is a Serenity value, which is string, return it, else send back string "N/A"
let new = captains["Serenity"] ?? "N/A"

let tvShow = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShow.randomElement() ?? "None"

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let input = ""
let potentialNumber = Int(input) ?? 0
print(potentialNumber)


// MULTIPLE OPTIONS - optiona chaining
// reading optionals in options
let roster = ["Jon", "Jane", "Jill", "John"]
// If the optional has a value inside, unwrap it and then ...
// If there is no value, use "No one"
let chosen = roster.randomElement()?.uppercased() ?? "No one"
print("\(chosen) is chose!")

// Another example
// Place books in alphabetical order based on author name
// Optional instance of Book
// Book could have author or not
// if it has author, attempt to read the first letter
// If first letter is there, uppercase it
var chosenBook: Book? = nil
let chosenAuthor = chosenBook?.author?.first?.uppercased() ?? "A"
print(chosenAuthor)


// HANDLE FUNCTION FAILURE WITH OPTIONALS
// Don't get to know how something failed
enum UserError: Error {
    case badID, networkFailed
}
func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}
// in this case, the optional is checking if getUser went through or not
// if it doesn't, it returns nil, so you don't get anything, not even the error
if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

// if getUser() returns a value string, assign to newUser, if not, assign "No user found"
let newUser = (try? getUser(id: 23)) ?? "No user found"

// try? is usually used in guard let, in combo with nil coalescing, or any throwing value with no return value


// CHECKPOINT 9
//Write a function that accepts an optional array of integers, and returns one of those integers randomly.
// If the array is missing or empty, return a new random number in the range 1 through 100.
// Write your function in a single line of code.
var myNumberList = [Int]()
//myNumberList.append(contentsOf: [101, 192, 885, 177, 764, 222, 876])
let pickedRandomNumber = myNumberList.randomElement() ?? Int.random(in: 1...100)
print(pickedRandomNumber)
