import UIKit

//Create and use closures

func greetUser() {
    print("Hi there!")
}

greetUser()
var greetCopy = greetUser // When we copy a function,
greetCopy()               // we don't write parentheses after the function

let sayHello = { (name : String) -> String in // in keywords ends the closure and start its functionality
    "Hi \(name)" }

sayHello("Taylor")

func getUserData(id : Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data : (Int) -> String = getUserData
let user = data(1989)
print(user)

let team = ["Gloria", "Suzanne", "Piper", "Tifanny", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1 : String, name2 : String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}

// let captainFirstTeam = team.sorted(by: captainFirstSorted)
// print(captainFirstTeam)

/* Reminder: Closures are hard... but that's a sign that
   everything is working normally */

let captainFirstTeam = team.sorted(by: { (name1 : String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
})

print(captainFirstTeam)

// Trailing closures and shorthand syntax

let captainFirstTeam2 = team.sorted { // Parameters of in and return can be put away because
    if $0 == "Suzanne" {              // are mandatory, so it wouldn't work if they are not received
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    
    return $0 < $1
}

print(captainFirstTeam2)

let reverseTeam = team.sorted { $0 > $1}
// Shorthand syntax is not recommended when closure's body is large/complex
// or when you $0,$1... syntax makes it more complicated to read

let tOnly = team.filter { $0.hasPrefix("T") } // Trailing syntax
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

//Accept functions as parameters
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    return numbers
}

let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}
print(rolls)

func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newNumbers = makeArray(size: 50, using: generateNumber)
print(newNumbers)

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}

//CHECKPOINT 5
/* Your input is this:
 
** Call one, then the other, then the other back to back without using temporary variables
 
 let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
 Your job is to:

 1.-Filter out any numbers that are even
 2.-Sort the array in ascending order
 3.-Map them to strings in the format “7 is a lucky number”
 4.-Print the resulting array, one item per line
 
 So, your output should be as follows:
 
 7 is a lucky number
 15 is a lucky number
 21 is a lucky number
 31 is a lucky number
 33 is a lucky number
 49 is a lucky number
 */

//Part 1: Filter even numbers
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
let filteredLuckyNums = luckyNumbers.filter { (number1 : Int) -> Bool in
    if number1%2 != 0 {
        return true
    }
    return false
}
print(filteredLuckyNums)
// Part 2: Sort in ascending order
let sortLuckyNums = filteredLuckyNums.sorted { (number1: Int, number2: Int) -> Bool in
    if number1 == 7 {
        return true
    } else if number2 == 7 {
        print(number2)
        print(number1)
        return false
    }
    return number1 < number2
}
print(sortLuckyNums)

//Part 3: Map them to string and formatting
let isLuckyNum = sortLuckyNums.map { (number: Int) -> String in
    return "\(number) is a lucky number"
    
}
print(isLuckyNum)

//Part 4: Print one by one per line on a chained
func printLuckyNumLines(first: () -> [Int], second: () -> [Int], third: () -> [String]) {
    first()
    second()
    third()
    for i in third() {
        print(i)
    }
}

printLuckyNumLines {
    filteredLuckyNums
} second: {
    sortLuckyNums
} third: {
    isLuckyNum
}
