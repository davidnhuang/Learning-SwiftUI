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
