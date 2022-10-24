import UIKit

func showWelcome() {
    print("Welcome to my app!")
    print("By default this prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

showWelcome()

let number = 139

if number .isMultiple(of: 2) {
    print("Even")
} else {
    print("Odd")
}

let roll = Int.random(in: 1...2)

func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end: 20)

// Return functions
let root = sqrt(169)
print(root)

func rollDice() -> Int {
    Int.random(in: 1...6)
}

let result = rollDice()
print(result)
/*Exercise
 -Do two strings contain the same letters, regardless of their order?
 *This function should:
    *Accept two string parameters
    *Return true if their letters are the same
 */

// My solution
let oneString = "amor"
let twoString = "mora"

hasSameLetters(firstString: oneString, secondString: twoString)

func hasSameLetters(firstString: String, secondString: String) -> Bool {
    let firstValue = firstString
    let secondValue = secondString
    
    if firstValue.sorted() == secondValue.sorted() {
        return true
    } else {
        return false
    }
}

//Professor solution

func areLettersIdentical(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}

// Keep learning

func pythagoras(a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}

let c = pythagoras(a: 3, b: 4)
print(c)

//Refactor pythagoras into one line and remove retun keyword
func pythagorasRefactored(a: Double, b: Double) -> Double {
    sqrt(a*a + b*b)
}

let d = pythagorasRefactored(a: 3, b: 4)
print(d)

//Void function to cancel process, we add return if something doesn't go well

func sayHello() {
    return
}

//We can avoid "return" when we only have a expression, but not with a statement

// if-else statement
func greet1(name: String) -> String {
    if name == "Taylor Swift" {
        return "Oh wow!"
    } else {
        return "Hello, \(name)"
    }
}

print(greet1(name: "Taylor Swift"))
print(greet1(name: "Jonathan Meixueiro"))

//Refactoring to single expression
func greet2(name: String) -> String {
    name == "Taylor Swift" ? "Oh wow!" : "Hello, \(name)"
}

print(greet2(name: "Taylor Swift"))
print(greet2(name: "Jonathan Meixueiro"))

//Return multiples values from functions

//Array
func getUser1() -> [String] {
    ["Taylor", "Swift"]
}
let user1 = getUser1()
print("Name: \(user1[0]) \(user1[1])")

//Dictionary
func getUser2() -> [String : String] {
    ["firstName" : "Taylor",
    "lastName" : "Swift"]
}
let user2 = getUser2()
print("Name: \(user2["firstName", default: "?"]) \(user2["lastName", default: "?"])")

//Tuples
//With names
func getUser3() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}
let user3 = getUser3()
//  *let firsName = user3.firstName
//  *let lastName = user3.lastName
//Destructuring...
//  *let (firstName, lastName) = getUser3()
let (firstName, _) = getUser3() //If we don't need a value, we use an underscore _

print("Name: \(user3.firstName) \(user3.lastName)")
//print("Name: \(firstName) \(lastName)")
print("Name: \(firstName)")

//Without names
func getUser4() -> (String,String) {
    ("Taylor", "Swift")
}
let user4 = getUser4()
print("Name: \(user4.0) \(user4.1)")


//Customize parameter labels

func rollDice2(sides: Int, count: Int) -> [Int] {
    var rolls = [Int]()
    
    for _ in 1...count {
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }
    return rolls
}

let rolls = rollDice2(sides: 6, count: 4)

func hireEmployee (name: String) {}
func hireEmployee (title: String) {}
func hireEmployee (location: String) {}

let lyric = "I see a red door and I want it painted black."
print(lyric.hasPrefix("I see"))

func isUppercase(_ string: String) -> Bool { //Underscore label "_" remove the external parameter name calling
    string == string.uppercased()           // a function
}

let string = "HELLO WORLD"
let result2 = isUppercase(string)

func printTimesTable(for number: Int) { // with a space " " we can use the parameter name as internal
    for i in 1...12 {                   // and call it with its label
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTable(for: 5)
