import UIKit

//Variables and Constants
var greeting = "Hello, playground"

var name = "Ted"
name = "Rebecca"
name = "Keeley"

let character = "Daphne"

var playerName = "Roy"
print(playerName)

playerName = "Dani"
print(playerName)

playerName = "Sam"
print(playerName)

let managerName = "Michael Scott"
let dogBreed = "Samoyed"
let meaningOfLife = "How many roads must a man walk down?"

//Strings
let actor = "Denzel Washington"
let fileName = "paris.jpg"
let result = "⭐️ \"You win\" !⭐️"

let movie = """
A day in
the life of
an Apple engineer
"""

let nameLenght = actor.count
print(nameLenght)

print(result.uppercased())

print(movie.hasPrefix("A day"))
print(fileName.hasSuffix(".jpg"))

print(actor)

//Integers
let score = 10
let reallyBig = 1_00__00___00____00

let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2

var counter = 10
counter += 5
print(counter)

counter *= 2
counter -= 10
counter /= 2

var number = 120
print(number.isMultiple(of: 3))
print(120.isMultiple(of: 3))

//Decimals
let number2 = 0.1 + 0.2

let a = 1
let b = 2.0
let c = Double(a) + b

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

var nameActor = "Nicolas Cage"
nameActor = "Jhon Travolta"

var rating = 5
rating *= 2
