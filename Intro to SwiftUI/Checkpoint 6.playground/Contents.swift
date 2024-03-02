import UIKit

// STRUCTS
// structs are custom data types - so we've created a data type called Album
struct Album {
    // Properties
    let title: String
    let artist: String
    let year: Int
    // Methods
    func albumInfo() {
        print("\(title) by \(artist), \(year)")
    }
    
}
// created an instance of struct Album
let heroesAndVillain = Album(title: "Heroes & Villains", artist: "Metro Boomin", year: 2023)
print(heroesAndVillain.artist)
heroesAndVillain.albumInfo()
// another example - structs are constants, and its properties inside are constants too
struct Employee {
    let name: String
    var vacationDaysRemaining: Int = 20 // set a default the same way
    
    // if you want to change values inside a struct, you need mutating in front
    mutating func requestVacation(days: Int) {
        if vacationDaysRemaining > days {
            vacationDaysRemaining -= days
            print("Approved! \(vacationDaysRemaining) days of PTO left.")
        } else {
            print("Denied. Exceeded PTO days. Please talk to your manager.")
        }
    }
    
}
// as a struct with mutating func, you must use variable instead of constant to initialize
var employee1 = Employee(name: "Jon Doe", vacationDaysRemaining: 21)
var employee2 = Employee(name: "Jane Doe")
employee1.requestVacation(days: 6)


// STORED AND COMPUTED PROPERTIES
struct Worker {
    let name: String
    var PTO = 14
    var usedPTO = 0
    
    // computed property
    var remainingPTO: Int {
        get {
            PTO - usedPTO
        }
        set {
            PTO = PTO + newValue //new value is whatever value you set
        }
    }
    
}
var John = Worker.init(name: "John Smith", usedPTO: 14)
John.remainingPTO
print(John.remainingPTO)
John.PTO = 5
print(John.remainingPTO)


// PROPERTY OBSERVER
struct Game {
    var score = 0 {
        // observes and executes every time new value is set
        didSet {
            print("Score is now \(score)")
        }
    }
}

var myTeam = Game()
myTeam.score += 1

// another example
struct App {
    var contacts = [String]() {
        // triggers before the changes is set
        willSet {
            print("Current list is \(contacts)")
            print("New list will be: \(newValue)")
        }
        // triggers after the set has happened
        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old count was \(oldValue.count)")
        }
    }
}

var contactsApp = App()
contactsApp.contacts.append("Joe Shmoe")
contactsApp.contacts.append("Jane Smith")
// avoid putting too much work in property observers


// CUSTOM INITIALIZERS
struct Player {
    let name: String
    let number: Int
    
    // custom initializer - make sure all properties are accounted for
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...20)
    }
    
}
let player = Player(name: "Jon Doe")


// PRIVATE, PUBLIC, FILEPRIVATE
// private: Don't let anything outside teh struct use this
// fileprivate: Don't let anything outside the current file use this
// public: let anyone anywhere use this
enum bankErrors: Error {
    case insufficient, overdraft
}
struct BankAccount {
    // private makes it so that only methods in the struct can change it, not outside the struct
    // private set makes it so that only the struct's methods can set, but still can access this data outside
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) throws {
        if funds > amount {
            funds -= amount
        } else {
            throw bankErrors.insufficient
        }
    }
    
}
var myAccount = BankAccount()
myAccount.deposit(amount: 200)

do {
    try myAccount.withdraw(amount: 10_001)
    print("Remaining funds: $\(myAccount.funds)")
} catch bankErrors.insufficient {
    print("Insufficient funds.")
    print("Current funds: $\(myAccount.funds)")
} catch {
    print("Something went wrong. Please try again.")
}


// STATIC PROPERTIES AND METHODS
struct School {
    // static means that you don't have to create an instance of school; it is not unique
    static var studentCount = 0
    // static funcs changes the static properties
    static func enroll(student: String) {
        print("\(student) has just enrolled")
        studentCount += 1
    }
    
}
School.enroll(student: "Johnny Smith")
print(School.studentCount)
// Static properties cannot reference non-static properties
// Non-static properties can access static properties
// Self and self are different
// self is current value of the struct
// Self is the current type of struct

// Another example
struct AppData {
    static let version = "1.3.2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.settings.org"
}
AppData.version

struct User {
    let username: String
    let password: String
    
    static let exampleUser = User(username: "Jon Doe", password: "password")
    
}

// CHECKPOINT 6
// create a struct about a car
// includes model
// includes number of seats
// includes current gear
// add a method to change gears up or down
struct Car {
    static let model = "Toyota"
    static let numberOfSeats = 5
    private var currentGear = 1 {
        willSet {
            print("Gear was set at \(currentGear)")
        }
        didSet {
            print("Gear now at \(currentGear)")
        }
    }
    
    mutating func shiftGear(by gear: Int) {
        if currentGear + gear <= 6 {
            currentGear += gear
        } else if currentGear + gear < 1 {
            currentGear = 1
        } else if currentGear + gear > 6 {
            currentGear = 6
        }
    }
    
}

var myCar = Car()
myCar.shiftGear(by: 10)
myCar.shiftGear(by: -4)
