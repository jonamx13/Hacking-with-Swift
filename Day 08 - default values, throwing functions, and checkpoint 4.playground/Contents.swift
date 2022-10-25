import UIKit

//Default values
func printTimesTables(for number : Int, end : Int = 12) {
    for i in 1...end{
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20 )
printTimesTables(for: 5)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)

//How to handle errors in functions
enum PasswordError : Error {
    case short, obvious
}

func checkPassword(_ password : String) throws -> String {
    if password.count < 5 { throw PasswordError.short }
    if password == "12345" { throw PasswordError.obvious }
    
    if password.count < 8 {
        print("OK")
    } else if password.count < 10{
        print("Good")
    } else {
        return "Excellent"
    }
    return "Error, most enter at least 5 characters."
}

let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
}
    catch {
        print("There was an error. \(error.localizedDescription)")
}


//CHECkPOINT 4
/*
 
 1.- You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
 2.- If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
 3.- You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
 4.- If you can’t find the square root, throw a “no root” error.
 */

let number : Double = 10_000

enum squareRootError : Error {
    case outOfBoundsDown, outOfBoundsUp, noRoot
}

func squareRoot(_ number: Double) throws {
    let rangeBounds = (min: 1, max: 10_000)
    //Errors pre-requisites
    if number < Double(rangeBounds.min) {
        throw squareRootError.outOfBoundsDown
        
    } else if number > Double(rangeBounds.max) {
        throw squareRootError.outOfBoundsUp
    }
    //Operation
    for i in stride(from: 1.0, through: 100.0, by: 1.0) {
        if i * i == number  {
            return print("Square root is \(i)")
        }
    }
    //Error after calculation
    throw squareRootError.noRoot
}

do {
    try squareRoot(number)
} catch squareRootError.outOfBoundsDown {
    print("Out of bounds - Try with a number greater than 1")
} catch squareRootError.outOfBoundsUp {
    print("Out of bounds - Try with a number smaller than 10,000")
} catch squareRootError.noRoot {
    print("Number without integer square root")
}
