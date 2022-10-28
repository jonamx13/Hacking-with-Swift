import UIKit

//Limit access to internal data using access control

/**
    --- ACCESS CONTROL KEYWORDS ---
    - private - Don't let anything outside the struct use this.
    - fileprivate - Don't let anything outside the current file use this.
    - public - Let anyone, anywhere use this.
    - private(set)- Let anyone read this property, but only let my methods write it
 */

struct BankAccount {
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)

//Static properties and methods

struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)

// self is for value -- 55 "Hello" true
// Self is for type -- Int String Bool

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFileName = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

AppData.version

struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "cfedrighi", password: "h4irf0rce0ne")
}

Employee.example.username
Employee.example.password

//CHECKPOINT 6

/**
 -Create a struct to store information about a car. Include:
    -Its model
    -Number of seats
    -Current gear
 -Add a method to change gears up or down.
 -Have a think about variables and access control.
 -Don't allow invalid gears - 1...10 seems a fair maximum range.
 */

struct Car {
    let model: String
    let seatsNumber: UInt8
    static var currentGear: UInt8 = 1
    private static let rangeGear: ClosedRange<Int> = 1...10
    
    
    //Static method to upgrade
    static func upgradeGear(_ to: UInt8) {
        let gearUp = to
        
        switch gearUp {
            case to where to > rangeGear.upperBound:
                print("You cannot upgrade beyond \(rangeGear.upperBound) limit.")
            
            case to where currentGear > to :
                print("You have a \(currentGear), you are looking for a downgrade.")
            
            case to where currentGear == gearUp:
                print("You already own that gear")
            
            default:
                print("You're upgrading from \(currentGear) gear to \(gearUp) gear.")
                currentGear = gearUp
        }
        
    }
    
    //Static method to downgrade
    static func downgradeGear(_ to: UInt8) {
        let gearDown = to
        
        switch gearDown {
            case to where to < rangeGear.lowerBound:
                print("You cannot downgrade below \(rangeGear.lowerBound) limit.")
            
            case to where currentGear < to :
                print("You have a \(currentGear), you are looking for an upgrade.")
            
            case to where currentGear == gearDown:
                print("You already own that gear")
            
            default:
                print("You're downgrading from \(currentGear) gear to \(gearDown) gear.")
                currentGear = gearDown
        }
        
    }
}
extension Car {
    init() {
        model = "Generic Sedan"
        seatsNumber = 4
    }
}


//Upgrade Test
print("Upgrade test")
print(Car.currentGear)
Car.upgradeGear(3)
Car.upgradeGear(2)
Car.upgradeGear(11)
print(Car.currentGear)

//Downgrade Test
print("Downgrade test")
print(Car.currentGear)
Car.downgradeGear(2)
Car.downgradeGear(0)
Car.downgradeGear(5)
print(Car.currentGear)

//Test properties and their extensions
Car(model: "Tesla", seatsNumber: 4)
let teslaCar = Car(model: "Tesla", seatsNumber: 4)

print(teslaCar.model)
print(teslaCar.seatsNumber)
print(teslaCar)

let genericCar = Car()

print(genericCar.model)
print(genericCar.seatsNumber)
print(genericCar)
