import UIKit

// Using Tuples to return multiple values
func getName() -> (firstName: String, lastName: String) {
    (firstName: "David", lastName: "Huang")
}

let name = getName()
print("\(name.firstName) \(name.lastName)")

func getFullName() -> (firstName: String, middleName: String, surname: String) {
    (firstName: "Erica", middleName: "Chavez", surname: "Buenrostro")
}

let fullname = getFullName()
print("Your name is \(fullname.firstName) \(fullname.middleName) \(fullname.surname)")

func getUserInfo() -> (id: String, password: String) {
    ("user1234", "password123!") // With tuples you don't always have to label things out - be lazy
}

let (userID, userPassword) = getUserInfo() // if you want to pull id or password out
print(userPassword) // this will print out password parameter

let sentence = "I see a red door and I want it painted black."
print(sentence.hasPrefix("I see"))

// Adding "_ " before makes it so that you don't have to label the parameters
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO WORLD"
let checkUppercase = isUppercase(string) // here, instead of string: string, you can just pass in string

// for is the external paramter name, and number is the internal param name - internalParam externalParam
func printTimesTable(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i*number)")
    }
}

printTimesTable(for: 5)
