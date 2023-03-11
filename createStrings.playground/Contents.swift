import UIKit

let actor = "Denzel Washington"
let filename = "file.jpg"
let reaction = "💪"
let quote = "\"To Be or Not To Be\""

let quoteBlock = """
Romeo, O' Romeo
Where for art thou
O' Romeo
"""
// String properties
let nameLength = actor.count //Number of characters in the string
print(nameLength)
let uppercaseQuote = quote.uppercased() //Converts all characters to uppercase
print(uppercaseQuote)

let userID = "AAA-192-20-1"
let isValidID = userID.hasPrefix("AAA") //Checks if there is AAA at the start of the string
print(isValidID)

let isFiletypeImage = filename.hasSuffix(".jpg") //Checks if there is .jpg at the end of the string
print(isFiletypeImage)

// Swift strings are case sensitive
