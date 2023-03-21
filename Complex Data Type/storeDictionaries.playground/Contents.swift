import UIKit

// This is a dictionary
let employee = [
    "name": "Jon Doe",
    "title": "do gooder",
    "location": "Boston"
]

//set default in case there's no value
print(employee["name", default: "unknown"])

let attendance = [
    "attendee": "Eric",
    "attended?": true,
    "seat location": "12E",
    "GPA": 4.0
] as [String : Any]

print(attendance["attendee", default: "unknown"])
print(attendance["GPA", default: "no GPA found"])

//keys don't always have to be strings
let results = [
    2022: 10,
    2023: 8,
    2024: 7,
    2025: 10
]
print(results[2023, default: 0])
print("The results for \(2022) is \(results[2022, default: 0])")

var heights = [String: Int]() //Creates an empty dictionary
heights["Jerry"] = 173
print(heights["Jerry", default: 0])
heights["Sherry"] = 120

//Override value at a specific key
heights["Sherry"] = 140
print(heights["Sherry", default: 0])
