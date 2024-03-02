import UIKit

// ARRAYS
// store multiple values of the same type in an array
var names = ["John", "Daisy", "Jason", "Danny"]
var results = [25.3, 28.2, 26.4]
var numbers = [4, 8, 12, 16]
// get a specific value in an array using position
let firstResult = results[0]
let winner = names[2]
// you cannot reference a value that doesn't exist in an array
// create an empty array
var scores = Array<Int>()
// add values into an empty array
scores.append(1)
scores.append(3)
// empty arrays always need a type
var books = Array<String>()
// like simple data types, array also has handy functions
scores.count
scores.removeLast()
scores.remove(at: 0)
scores.removeAll()
var novels = ["Harry Potter", "Moby Dick", "Twin Towers", "Great Expectations"]
novels.contains("Moby Dick")
novels.contains("Old Man And The Sea")
// sort an array, alphabetically by default
novels.sorted()
let cities = ["Attonberg", "Berlin", "Charleston", "Denver"]
cities.reversed()


// DICTIONARIES
// store data and reference based on keys
var employee1 = [
    "name" : "Jon Doe",
    "role" : "writer",
    "location" : "California"
]
// reference parts of dictionary
employee1["name"]
// make sure when referencing to always provide a default
print(employee1["name", default: "No name."])
print ("Welcome \(employee1["name", default: "No Name"]) to your first day as a \(employee1["role", default: "[Error]"]).")
// you can store other data types in a dictionaries as well
var student1 = [
    "name" : "Sally Sue",
    "ranking" : 2,
    "enrolled classes" : 10,
    "GPA" : 3.8
] as [String : Any]
// you can create an empty dictionary. Any allows different data types to be stored
var coordinates = [String: Any]()
coordinates["name"] = "Site A"
coordinates["latitude"] = 3.19208291
coordinates["longitude"] = 1.290182
print("\(coordinates["name", default: "Not found."]) : \(coordinates["latitude", default: "Not Available"]), \(coordinates["longitude", default: "Not Available"])")


// SETS
// sets are arrays that don't have duplicate items and doesn't have order
var primes = Set([1,3,5,7,11,13,17,19])
// to add new values to the set, you insert
primes.insert(23)
// create empty sets with the following
var items = Set<String>()
items.insert("Bandage")
items.contains("Legendary Item")
// like arrays, sets have a handy function
items.sorted()
items.count


// ENUMS
// a set of possible values
enum Weekday {
    case Monday, Tuesday, Wednesday, Thursday, Friday
}
var day = Weekday.Monday
// this variable now can only accept enum cases
day = Weekday.Friday
day = .Thursday


// TYPE ANNOTATION
// allow use to be specific about the data type of a variable
var username: String = "hello123"
var score: Int = 0
var powered: Bool = false
let pi: Double = 3.14159
var albums: [String] = []
var phonebook: [String: Int] = ["entry1": 626123456]
// only need annotation if you are creating empty sets/arrays/dictionaries
var drinks: [String] = []
var types = [String]()
enum themes {
    case light, dark, system
}
var style: themes = themes.system
style = .light
// use type inference as often as possible - more typing is more possibility of error
// create a constant that doesn't have a value
let fetusGender: String
// until you assign a value to the constant, you cannot use it
fetusGender = "Male"
// now, the constant has value and cannot be changed
// general rule of thumb, only use type annotation when variables or constants are not initiated/doesn't have a value but has been created.


// CHECKPOINT 2
// create an array of strings
// then, write code that prints the number of items in the array and the number of unique items in the array
var classmates = ["Adam", "Belle", "Charlie", "Daniel", "Elliot", "Frank", "Gena", "Adam", "Daniel"]
var classmateNames = Set(classmates)
print("There are \(classmates.count) students in this class, and there are \(classmateNames.count) unique names.")
