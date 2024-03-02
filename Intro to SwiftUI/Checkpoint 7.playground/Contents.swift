import UIKit

// CLASS
// very similar to structs. Differs in 5 ways
// 1. Inheritance
// 2. Need to have custom init or properties have default values
// 3. Copies of classes points to the same data
// 4. Can deinitialize
// 5. Constant class instances can have vaiable properties

// Example
class Game {
    var score = 0 {
        didSet{
            print("Score is now \(score)")
        }
    }
}
var basketballGame = Game()
basketballGame.score += 10
var soccerGame = Game()
print(soccerGame.score)

// INHERITANCE
class Employee {
    let hours: Int
    let ID: String
    
    init(hours: Int, ID: String) {
        self.hours = hours
        self.ID = ID
    }
    
    func workSummary() {
        print("I work \(hours/5) per day")
    }
    
}
// Developer and Manager are sub classes to Employee
class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
}
class Manager: Employee {
    func work() {
        print("I'm writing Jira tickets for \(hours) hours.")
    }
    override func workSummary() {
        print("I spent the extra \(hours - 80) arguing about timelines.")
    }
}
// Final class does not inheritance - nothing can inherit from a final class
final class AIassistant: Employee {
    func work() {
        print("I work however long I need to.")
    }
}
// Class inheritance in use
let albert = Manager(hours: 80, ID: "001")
albert.work()
let neil = Developer(hours: 40, ID: "012")
neil.work()
neil.workSummary()
// Child class can change the parent class with overrides
albert.workSummary()


// INITIALIZERS
// if a child class has any custom init, it must call the parent init
class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
    
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}
let toyotaPrius = Car(isElectric: true, isConvertible: false)


// REFERENCE CLASS, OR COPY CLASSES
class User {
    var username = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
    
}
var user1 = User()
var user2 = user1
user2.username = "David"
print(user2.username)
// changes to 1 will change to other
var user3 = User()
print(user3.username)
var user4 = user1.copy()
print(user4.username)


// DEINITIALIZER
// calls when a class gets destroyed
// you don't use func inside deinit
// deinit never take parameters and never return
// deinit runs when lass copy of the class instance is destroyed
// never call deinit directly - system calls it
// structs don't have deinit

// scope - the context where info is available
// func { scope } for example

class TestDummie {
    
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("Test Dummie \(id): Created!")
    }
    // after an instance is done or destroyed
    deinit {
        print("Test Dummie \(id): Destroyed")
    }
    
}

var testedDummies = [TestDummie]()

for num in 1...3 {
    let dummie = TestDummie(id: num)
    print("Test Dummie \(dummie.id) currently testing...")
    // do work...
    testedDummies.append(dummie)
}

print("Testing complete!")
testedDummies.removeAll() // this is the moment test dummies instance is destroyed, or deinit
print("All dummies cleared.")


// VARIABLES IN CLASSES
class Person {
    var name = "Jon"
    let legs = 2
}
let person = Person() // even though this is init as a constant, the var inside can be changed, but the class is still the same
person.name = "Jason"
print(person.name)
var person2 = Person()
person2.name = "Jane"
person2 = Person()
print(person2.name) // var allows use to assign it as a new User()


// CHECKPOINT 7
// make a class hierarchy for animals
// start with Animal - add a legs property for the number of legs tan animal has.
// make a Dog subclass of Animal, giving it a speak() method that prints a dog barking string, but each subclass prints something different
// Make Corgi and Poodle subclass of Dog
// Make a cat subclass with a speak() method that prints something different, and has an isTame boolean, set with an initializer

class Animal {
    var legs: Int
    
    func speak() {
        print("Sound...")
    }
    
    init(legs: Int) {
        self.legs = legs
    }
    
}

class Dog: Animal {
    override func speak() {
        print("Woof! Woof!")
    }
}

class Corgi: Dog {
    init() {
        super.init(legs: 4)
    }
}
class Poodle: Dog {
    init() {
        super.init(legs: 4)
    }
}

class Cat: Animal {
    var isTame: Bool
    
    override func speak() {
        print("Meow...Meow...")
    }
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
}

class Lion: Cat {
    init() {
        super.init(legs: 4, isTame: false)
    }
}
class HouseCat: Cat {
    init() {
        super.init(legs: 4, isTame: true)
    }
}

let Ein = Corgi()
Ein.speak()
let Sebastian = HouseCat()
Sebastian.speak()
Sebastian.isTame
