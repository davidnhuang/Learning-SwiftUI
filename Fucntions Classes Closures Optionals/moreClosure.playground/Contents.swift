import UIKit

let team = ["Betty", "Adam", "Charlie", "Zed", "Tom"]

// There are shorter ways to write the following closure
let leadFirstTeam = team.sorted(by: { (first: String, second: String) -> Bool in
    if first == "Charlie" {
        return true
    } else if second == "Charlie" {
        return false
    }

    return first < second
})

print(leadFirstTeam)

let shorterLeadFirstTeam = team.sorted { first, second in
    if first == "Charlie" {
        return true
    } else if second == "Charlie" {
        return false
    }
    
    return first < second
}

print(shorterLeadFirstTeam) // this should work the same

// here is an even shorter way of doing the same
let shortestLeadFirstTeam = team.sorted {
    if $0 == "Charlie" {
        return true
    } else if $1 == "Charlie" {
        return false
    }
    
    return $0 < $1
}

print(shortestLeadFirstTeam)

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)
