import UIKit

enum SomeEnumeration {
    //Enumeration definition here
}

enum CompassPoint: String {
    case north
    case south
    case east
    case west
}

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToGo = CompassPoint.east
directionToGo = .west

switch directionToGo {
    
    case .north:
        print("Winter is coming")
    case .south:
        print("There's penguins at south")
    case .east:
        print("Mordor extends to eastern lands")
    case .west:
        print("Beware with cowboys")
}

let somePlanet = Planet.mars

switch somePlanet {
    case .earth:
        print("Earth is safe")
    default:
        print("Isn't safe to visit this planet")
}

enum Beverage: CaseIterable {
    case coffee, tea, juice, rebull
}

let numberOfChoices = Beverage.allCases.count
for beverage in Beverage.allCases {
    print(beverage)
}

//Exercise
enum BeltRanks: CaseIterable {
    case white, blue, purple, brown, black
}

var students = [String : BeltRanks]()

func registerStudent(studentName: String, belt: BeltRanks) {
    students.updateValue(belt, forKey: studentName)
    print("\(studentName) is a new \(belt) belt in the academy")
}

registerStudent(studentName: "Jonathan", belt: .white)
registerStudent(studentName: "Jonathan", belt: .blue)

//Enumerations Barcodes

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85989, 38982, 2)
//productBarcode = .qrCode("AKJHDFJS")

switch productBarcode {
    case let .upc(numberSystem, manufacturer, product, check):
        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
    case let .qrCode(productCode):
        print("QR: \(productCode)")
}

//Enumeration raw values
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case linefeed = "\n"
    case carriageReturn = "\r"
}

let earthOrder = Planet.earth.rawValue

let northDirection = CompassPoint.north.rawValue

let possiblePlanet = Planet(rawValue: 5)

let planetPosition = 11

if let anyPlanet = Planet(rawValue: planetPosition) {
    switch anyPlanet {
        case .earth:
            print("Earth is safe")
        default:
            print("Isn't safe to visit this planet")
    }
} else {
    print("The selected planet doesn't exist")
}
