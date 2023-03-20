import UIKit

//Sets are like arrays that don't have order - fast lookup
var names = Set(["Jon", "Jane", "Dan", "Adam", "Diane"])

//Inserting item into set
names.insert("Zach")
print(names)

//Create an empty set
var prime = Set<Int>()
prime.insert(1)
prime.insert(3)
prime.insert(5)
prime.insert(7)
print(prime)
prime.insert(7) //Cannot insert duplicates - Swfit will reject insert

prime.contains(11)
prime.count
