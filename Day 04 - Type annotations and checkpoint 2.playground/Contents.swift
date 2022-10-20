import UIKit

//Primitive Data Types
let surname: String = "Lasso"
var score: Double = 0

let playerName: String = "Roy"
var luckyNumber: Int = 13
let pi: Double = 3.141
var isAuthenticated: Bool = true

//Array
var albums: [String] = ["Red", "Fearless"]
//Dictionary
var user: [String: String] = ["id": "@jonamx13"]
//Sets
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, woman, Other"])

//Array forms
var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()

enum UIStyle {
    case light, dark, system
}

var style: UIStyle = UIStyle.light
style = .dark

let userName: String
//lots of complex logic
userName = "jonamx13"
//lots of complex logic
print(userName)


//Checkpoint

//Create an array of string, then write some code that
//prints the number of items in the array
//and also the number of unique items in the array

var names: [String] = ["Strings", "Sets", "Enum", "Sets", "Strings", "Enum"]
print(names.count)

var namesUnique: Set<String> = []

for i in names.indices {
    namesUnique.insert(names[i])
}

print(namesUnique)
print(namesUnique.count)
