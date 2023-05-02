import UIKit

// Enum - error type
enum PasswordError: Error {
    case short, obvious
}

// throw tells that the function can throw an error, not that it must
// this function must return a String value
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {throw PasswordError.short}
    if password.hasPrefix("12345") || password.hasPrefix("password") {throw PasswordError.obvious}
    
    if password.count <= 5 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Strong"
    }
}

let password = "password123412"

// Do risky code -> catch error
// try before risky function
do {
    let result = try checkPassword(password)
    print("Password ratintg : \(result)")
} catch PasswordError.short {
    print("Too short")
} catch PasswordError.obvious {
    print("Too obvious")
}  catch {
    print("Error with password - \(error.localizedDescription)")
}
