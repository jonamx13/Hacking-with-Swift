import UIKit

let opposites = [
    "Mario" : "Wario",
    "Luigi" : "Waluigi"
]

let peachOpposite = opposites["Peach"]

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty")
}

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil
let number2 = number

if let unwrappedNumber = number {
    //Valid at this scope where unrappedNumber is a non-optional value
    
    print(square(number: unwrappedNumber))
    
    //Valid at this scope where unrappedNumber is a non-optional value
}

// As soon as we exit the scope, we're back to the optional value

//Unwrap optionals with guard
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    
    print("\(number) x \(number) is \(number * number)")
}

//Nil coalescing
let captains = [
    "Enterprise" : "Picard",
    "Voyager" : "Janeway",
    "Defiant" : "Sisko"
]

let newCaptains = captains["Serenity", default: "N/A"]

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let input = ""
let numberCoal = Int(input) ?? 0

print(numberCoal)

//Reading a dictionary key will always return an optional
// in this case we would like to use nil coalescing or "default" parameter
let scores = ["Picard": 800, "Data": 7000, "Troi": 900]
let crusherScore = scores["Crusher"] ?? 0

let planetNumber: Int? = 426
var destination = planetNumber ?? 3

//Optional chaining

let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "None"

print("New in line: \(chosen)")

struct BookCoal {
    let name: String?
    let author: String?
}

var newBook: BookCoal? = nil
let authorCoal = newBook?.author?.first?.uppercased() ?? "A"

print(authorCoal)

var bestScore: Int? = nil
bestScore = 101

if let bestScoreUwrp = bestScore,
        bestScoreUwrp > 100 { print("You got a highscore of \(bestScoreUwrp)") }

else { print("Better luck next time buddy") }

//Handle function failure with optionals

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)

//CHECKPOINT 9

/*
 
 -Write a function that accepts an optional array of integers, and returns one of those integers randomly.
 -if the array is missing or empty, return a new random number in the range 1 through 100.
 -Write your function in a single line of code.
 
 */

//Data
let intArray: [Int]? = [2,5,67,4,3,9,10,44,789,1798]
let rndRange: Int = Int.random(in: 1..<100)

//Normal way
func rndInteger(of arrayInt: [Int]?) -> Int {
    if let numberRnd = arrayInt {
        return numberRnd.randomElement()!
    }
    return rndRange
}

print("\"\( rndInteger(of: intArray) )\" is a random number from an [Int]? as value.")
print("\"\( rndInteger(of: nil) )\" is a random number from an range (1..<100), result of \"nil\".")

//One-liner way
func rndOneLiner (from intArray: [Int]?) -> Int { return intArray?.randomElement() ?? rndRange }


print("\"\( rndOneLiner(from: intArray) )\" is a random number from a one-liner function with an [Int]? as value.")
print("\"\( rndOneLiner(from: nil) )\" is a random number from a one-liner function with a range (1..<100), result of \"nil\".")

//One-Liner variable variable way
let intArray1: [Int]? = [2,5,67,4,3,9,10,44,789,1798]
let rndOneLine1 = intArray1?.randomElement() ?? rndRange
print(rndOneLine1)
print(intArray1?.randomElement() ?? rndRange)

let intArray2: [Int]? = nil
let rndOneLine2 = intArray2?.randomElement() ?? rndRange
print(rndOneLine2)
print(intArray2?.randomElement() ?? rndRange)
