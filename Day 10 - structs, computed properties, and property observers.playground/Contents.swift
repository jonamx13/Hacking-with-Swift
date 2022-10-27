import UIKit

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)


red.printSummary()
wings.printSummary()

/**
 MARK: If we create an employee as a constant using let,
 Swift makes the employee and all its data constant.
 We can call functions just fine, but those functions shouldn't be allowed
 to change the struct's data because we made it constant (2)
 
 Swift makes us take an extra step:
 any functions that only read data are fine as they are,
 but any that change data belonging to the struct
 must be marked with a special keyword : "mutating" (1)
*/
struct Employee {
    let name: String
    var vacationRemaining: Int = 14
    
    mutating func takeVacation(days: Int) { //1.-When we're gonna manipulate data, we add "mutating" keyword
        if vacationRemaining > days {
            vacationRemaining -=  days // 2.-Even when it's marked as "var" it becomes constan
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

let a = 1
let b = 2.0
let c = Double(a) + b

let kane = Employee(name: "Lana Kane")
let poovey = Employee(name: "Pam Poovey", vacationRemaining: 35)

//Computed properties

struct Employee2 {
    var name: String
    var vacationAllocated: Int = 14
    var vacationTaken: Int = 0
    
    var vacationRemaining: Int {
        //Code that reads
        get {
            vacationAllocated - vacationTaken
        }
        //Code that writes
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer2 = Employee2(name: "Sterling Archer", vacationAllocated: 14)
archer2.vacationTaken += 4
archer2.vacationRemaining = 5
print(archer2.vacationAllocated)

// Property observers: didSet - willSet
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 10
game.score += 1

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }
        
        didSet {
            print("There are now \(contacts.count) contacts")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

//Custom Initializers
struct Player {
    let name: String
    let number: Int
    
    init (name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan R")
print(player.number)

//To keep memberwise initializer, we create an extension for our custom initializer
struct EmployeeAn {
    var name: String
    var yearsActive = 0
}

extension EmployeeAn {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

// Creating a named employee now works
let roslin = EmployeeAn(name: "Laura Roslin")
print(roslin.name)
print(roslin.yearsActive)

// As does creating an anonymous employee
let anon = EmployeeAn()
print(anon.name)
print(anon.yearsActive)
