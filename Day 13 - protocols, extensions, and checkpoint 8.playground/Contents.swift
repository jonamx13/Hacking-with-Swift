import UIKit

protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int  { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
    
}

protocol canBeElectric {
    
}

struct Car: Vehicle, canBeElectric {
    let name = "Car"
    var currentPassengers = 1
    
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }
    
    func opensunRoof() {
        print("It's a nice day")
    }
}

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassengers = 1
    
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance)km")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)

getTravelEstimates(using: [car, bike], distance: 150)

//Opaque return types

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())

let num = getRandomNumber() // It's an equatable

//Create and use extensions

var quote = "   The truth is rarely pure and never simple   "

//Normal way
let trimmed1 = quote.trimmingCharacters(in: .whitespacesAndNewlines)

//Extension way
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

var trimmed2 = quote.trimmed()
quote.trim()

//Global function way
func trim(_ string: String) -> String{
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}

let trimmed3 = trim(quote)

print(trimmed1)
print(trimmed2)
print(trimmed3)

/*
 ADVANTAGES OF EXTENSIONS OVER GLOBAL FUNCTIONS
 
 -Code completion: it appears in our functionalities list after "."
 -Code organization: extensions are naturally grouped by the type of data they are applied to
 -Internal access: extensions get full access to properties and methods of their type of data
 */

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)

struct Book {
    let title : String
    let pageCount : Int
    let readingHours: Int
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr1 = Book(title: "Lord of the Rings: The Fellowship of the Ring", pageCount: 1178, readingHours: 24)
let lotr2 = Book(title: "Lord of the Ring: The Two Towers", pageCount: 415)

print(lotr1.readingHours)
print(lotr2.readingHours)


//Protocol extensions
extension Collection { // it extends arrays, sets and dictionaries
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guests count: \(guests.count)")
}

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi! I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

//CHECKPOINT 8
/*
 -Make a protocol that describes a building.
 -Your protocol should require the following:
    -A property storing how many rooms it has.
    -A property storing the cost as an integer.
    -A property storing the name of the estate agent selling the building.
    -A method for printing the sales summary of the building.
 -Create two structs, "House" and "Office", that conform to it.
 */

//Add commas for prices
extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}
// Protocols
protocol Building {
    var roomsCount: Int { get set }
    var cost: Int { get set }
    var estateAgent: String { get set }
    var typeOfBuilding: String { get }
    
    func salesSummary()
}

extension Building {
    var USDFormat: String {
        return "$\(cost.withCommas()) USD"
    }
    func salesSummary() {
        print("This is a \(typeOfBuilding) with \(roomsCount) rooms, sold by the agent \"\(estateAgent)\" for \(USDFormat)")
    }
}



struct House: Building {
    var roomsCount: Int
    var cost: Int
    var estateAgent: String
    let typeOfBuilding: String = "House"
}

struct Office: Building {
    var roomsCount: Int
    var cost: Int
    var estateAgent: String
    let typeOfBuilding: String = "Office"
}

//Test House
let newHouse = House(roomsCount: 4, cost: 100_000, estateAgent: "Taylor Swift")
newHouse.salesSummary()

//Test Building
let newOffice = Office(roomsCount: 3, cost: 200_000, estateAgent: "Jonathan Meixueiro")
newOffice.salesSummary()
