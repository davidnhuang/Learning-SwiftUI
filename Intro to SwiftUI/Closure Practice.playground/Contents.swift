import UIKit

//CLOSURE PRACTICE

// simple closure
let greet = {
    print("Hello there!")
}
greet()

// closure with parameter
let greetIn = { (language: String) in
    if language == "English" {
        print("Hello!")
    } else {
        print("More languages coming soon...")
    }
}
greetIn("Chinese")

// trailing synctax
let helloToMyself = { (name: String, extraMessage: String) in
    print("Hello, I am \(name)! \(extraMessage)")
}

helloToMyself("David", "Nice to meet you!")
