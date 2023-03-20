import UIKit

//Enumeration, or enums, set of named values
enum Weekday {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
}

var day = Weekday.Monday
print(day)

day = Weekday.Tuesday
print(day)

enum Weekend { case Saturday, Sunday }

day = .Wednesday //Notice that I cannot assign Weekend. to this variable since it's stuck with Weekday enum
