import UIKit

// Booleans
let fileName = "paris.jpg"
print(fileName.hasSuffix(".jpg"))

let number = 120
print(number.isMultiple(of: 3))

let goodDogs = true
var gameOver = false
print(gameOver)
gameOver.toggle()
print(gameOver)

let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

//Strings

let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart

let people = "Haters"
let action = "hate"
let lyrics = people + " gonna " + action
print(lyrics)

let luggageCode = "1" + "2" + "3" + "4" + "5"

let quote = "Then he tapped a sign saying \"Believe\" and walked away"

let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old"
print(message)

let number2 = 11
let missionMessage = "Apollo \(number) landed on the moon."

print("5 x 5 is \(5 * 5)")

//Checkpoint 1 -> Convert from Celsius to Farenheint
let Celsius : Float = 32.0

let Farenheint = (Celsius * 9)/5 + 32
let Kelvin = ((Farenheint - 32) * 5/9) + 273.15

print("\(Celsius)ºC == \(Farenheint)ºF == \(Kelvin) K")

// Calculate discount
let input = (price: 380.89, discount: 50.0)
var pResult : String = calculatePriceWithDiscount()

print(pResult)


func calculatePriceWithDiscount() -> String {
    
    let price = input.price
    let discount = input.discount
    
    let newPrice = (price * (Double(100.0) - discount)) / 100
    return "El nuevo precio con descuento es $ \(newPrice)"
}
