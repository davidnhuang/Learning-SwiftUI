import UIKit

//Array
var people = ["Adam", "Betty", "Charlie", "Danning"] //strings
let primes = [1, 3, 5, 7, 11, 13, 17, 19] //integers
var temperatures = [54.0, 48.5, 32.1, 45.0, 56.1] //Doubles

//Read
let thirdPerson = people[2]
let fourthPrime = primes[3]

//Change
people.append("Elliot")
print(people)

//Empty array
var years = Array<Int>() //This is how you create an empty array, in this case for integars
var evenNumber = [Int]() //Another way to start an empty array

//Properties
var albums = ["Kissland", "House of Balloons", "Star Boy", "After Hours", "106.5 Dawn FM"]
albums.count //Count number of items in array
albums.removeFirst() //Remove first item
albums.removeLast() //Remove last item
albums.count
albums.contains("What A Time To Be Alive") //Checks if the array contains the following

let roster = ["Zac", "Donny", "Kate", "Jill"]
roster.sorted() //This sorts the list alphabetically

let results = [100, 99, 23, 47, 96, 75]
results.sorted() //Sorts lowest to highest

let reversedRoster = roster.reversed()
