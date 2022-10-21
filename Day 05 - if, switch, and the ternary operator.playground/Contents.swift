import UIKit

let score = 85

if score > 80 {
    print("Great job!")
}

let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("Where we're going, we don't need roads.")
}

if percentage < 85 {
    print("Sorry, you've failed the test.")
}

if age >= 18 {
    print("You're eligible to vote.")
}

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

var numbers = [1,2,3]
numbers.append(4)

if numbers.count > 3 {
    numbers.remove(at: 0)
}

print(numbers)

let country = "Canada"

if country == "Australia" {
    print("G'day")
}

let name = "Taylor Swift"

if name != "Anonymous" {
    print("Welcome, \(name)")
}

var userName = "taylorswift13"

if userName.isEmpty == true {
    userName = "Anonymous"
}

print("Welcome, \(userName)")


let currentAge = 18

if currentAge >= 18 {
    print("You can vote in the next election.")
} else {
    print("Sorry, you're too young to vote.")
}

let a = false
let b = false

if a {
    print("Code if a it's true")
} else if b {
    print("Code if b it's true")
} else {
    print("Code if both a and b are false")
}

let temp = 25

if temp > 20 && temp < 30 {
    print("It's a nice day.")
}

let userAge = 14
let hasParentalConsent = true

if userAge > 18 || hasParentalConsent {
    print("You can buy the game!")
}

enum TransportOption {
    case airplane, helicopter, bicycle, car, escooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly")
} else if transport == .bicycle {
    print("I hope there's a bike path...")
} else if transport == .car {
    print("Let's get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!.")
}


// Switch

enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

switch forecast {
    case .sun:
        print("It should be a nice day")
    case .rain:
        print("Pack an umbrella.")
    case .wind:
        print("Wear something warm")
    case .snow:
        print("School is cancelled")
    case .unknown:
        print("Our forecast generator is broken!")
}

let place = "Metropolis"

switch place {
    case "Gotham":
        print("You're Batman!")
    case "Mega-City One":
        print("You're Judge Dredd!")
    case "Wakanda":
        print("You're Black Panther!")
    default:
        print("Who are you?")
}

let day = 5
print("My true love gave to me...")

switch day {
    case 5:
        print("5 Golden Rings")
        fallthrough
    case 4:
        print("4 Calling Birds")
        fallthrough
    case 3:
        print("3 French Hens")
        fallthrough
    case 2:
        print("2 Turtle Doves")
        fallthrough
    default:
        print("A partridge in a pear tree")
}

//Ternary operator

let ageTer = 18
let canVote = ageTer >= 18 ? "Yes" : "No"

let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")

let names = ["Jayne","Kaylee","Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)

enum Theme {
    case light, dark
}

let theme = Theme.dark
let background = (theme == Theme.dark) ? "Black" : "White"
print(background)
