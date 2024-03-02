import UIKit

// PROTOCOLS
// contracts for our code - defines generally what this type would do
protocol Vehicle {
    var name: String { get } // read only
    var currentPasssenger: Int { get set } // read and write
    
    func ETA(for distance: Int) -> Int
    func travel(distance: Int)
}
protocol isElectrified {
    var batteryLife: Int { get }
}
// adopting/conforming to protocol
struct Car: Vehicle, isElectrified {
    //conforming
    let name = "Toyota"
    let batteryLife = 2
    var currentPasssenger = 1
    func ETA(for distance: Int) -> Int {
        distance/50
    }
    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }
    // others
    func playMusic() {
        print("Playing music on CarPlay...")
    }
}
struct Bicycle: Vehicle, isElectrified {
    let name = "Cannondale"
    let batteryLife = 1
    var currentPasssenger = 1
    func ETA(for distance: Int) -> Int {
        distance / 10
    }
    func travel(distance: Int) {
        print("I'm biking \(distance)km.")
    }
}
func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.ETA(for: distance) > 100 {
        print("Too slow! Try another vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}
func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.ETA(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km.")
    }
}
var myCar = Car()
myCar.name
myCar.currentPasssenger = 4
commute(distance: 200, using: myCar)
myCar.playMusic()
var myBike = Bicycle()
commute(distance: 200, using: myBike)
let myTransports: Array<Vehicle> = [myCar, myBike]
getTravelEstimates(using: myTransports, distance: 200)


// OPAQUE RETURN TYPES
// very common in SwiftUI - a return type that is flexible; let swift figure it out
func getRandomNum() -> some Equatable {
    Int.random(in: 1...10) // equatable for int
}
func getRandomBool() -> some Equatable {
    Bool.random() // equatable for bool
}
print(getRandomNum() == getRandomNum())
let num = getRandomNum()


// EXTENSIONS
// Add functionality to any type, our own or native ones

// Extension adds to the String data type - this is like modding the type.
// Makes functionalities easy to find
// makes code more organized
// access to all of the internal methods inside a type
// can only add computed properties in extension
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines) // self because trimmingCharacter() is built in already
    }
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

var quote = "    To be or not to be. That is the truth.        "
let trimmedQuote = quote.trimmed()
print(trimmedQuote)

let lyrics = """
Roses are read
Violets are blue
Something something something
I love you
"""
print(lyrics.lines.count)

// Another example
struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}
extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}
let LOTR = Book(title: "Lord of the Rings", pageCount: 2000, readingHours: 24)
let HarryPotter = Book(title: "Harry Potter", pageCount: 90)


// PROTOCOL EXTENSIONS
// you can add extensions to protocols
// extensions always at top
// Collection includes array, set, dictionary
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}
let guests = ["Mario", "Luigi", "Peach"]
if guests.isNotEmpty {
    print("\(guests.count) guests in the list.")
}
let bookshelf = Set(["Book A", "Book B", "Book G", "Book H"])
bookshelf.isNotEmpty
// Another example
protocol Person {
    var name: String { get }
    func greet()
}
extension Person {
    func greet() {
        print("Hi, I'm \(name)")
    }
}
struct Employee: Person {
    let name: String
}
let david = Employee(name: "David Huang")
david.greet()


// EXTRA CREDIT
// More about extensions
extension Numeric {
    // using Self so that it is dynamic and follows whatever type we feed it
    func squared() -> Self {
        self * self
    }
}

let wholeNumber = 5
print(wholeNumber.squared())
let decimalNumber = 0.3
print(decimalNumber.squared())

// Another example
struct User: Equatable, Comparable {
    let name: String
    
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name
    }
    
}
let user1 = User(name: "Jon")
let user2 = User(name: "Jane")
print(user1==user2)
print(user1 < user2)


// CHECKPOINT 8
// Make a protocol that describes a building
// in the protocol include...
// a property storing how many room it has
// a prop storing the cost as an int
// a prop storing the name of the agent selling the building
// a method for printing hte sales usmmary of the building
// create 2 strucs, house and office, and conform to Building
protocol Building {
    var numberOfRooms: Int { get }
    var costPerRoom: Int { get }
    var agent: String { get set }
    
    func printSalesSummary()
}
struct House: Building {
    let numberOfRooms = 5
    let costPerRoom = 1350
    var agent = "Sam Smith"
    
    func printSalesSummary() {
        print("\(agent) sold this house for the price of $\(numberOfRooms*costPerRoom)")
    }
}
struct Office: Building {
    let numberOfRooms = 200
    let costPerRoom = 1100
    var agent = "Jane Doe"
    
    func printSalesSummary() {
        print("\(agent) sold this office building for the price of $\(numberOfRooms*costPerRoom)")
    }
}
let myHouse = House(agent: "Josey Jackson")
myHouse.printSalesSummary()
let workOffice = Office(agent: "Haley Chung")
workOffice.printSalesSummary()
