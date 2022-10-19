import UIKit

// Arrays
var beatles = ["John", "Paul", "George", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.1, 26.4]

print(beatles[0])
print(numbers[1])
print(temperatures[2])

beatles.append("Adrian")
beatles.append("Allen")
beatles.append("Adrian")
beatles.append("Novall")
beatles.append("Vivian")

var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

var albums = [String]()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")
print(albums.count)

var characters = ["Lana", "Pam", "Ray", "Sterling"]

characters.remove(at: 2)
print(characters.count)

characters.removeAll()
print(characters.count)

let bondMovies = ["Casino Royale", "Spectre", "No Time to Die"]
print(bondMovies.contains("Frozen"))


let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)

//Dictionaries
var employee = ["Taylor Swift", "Singer", "Nashville"]
print("Name: \(employee[0])")
print("Job title: \(employee[1])")
print("Location: \(employee[2])")

var employee2 = [
    "name" : "Taylor Swift",
    "job" : "Singer",
    "location" : "Nashville"
]

print(employee2["name", default: "Unknown"])
print(employee2["job", default: "Unknown"])
print(employee2["location", default: "Unknown"])


let hasGraduated = [
    "Eric": false,
    "Maeve": false,
    "Otis": false
]


let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]

print(olympics[2012, default: "Unknown"])

var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neil"] = 216
heights["LeBron James"] = 206

    //Overriding dictionary's values
var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "Penguin"

print(archEnemies["Batman", default: "Unknown"])

//Sets
let actors1 = Set([
    "Denzel Washington",
    "Tom Cruise",
    "Nicolas Cage",
    "Samuel L Jackson"
])

print(actors1)

    // it has no order, it's different every time
var actors2 = Set<String>()
actors2.insert("Denzel Washington")
actors2.insert("Tom Cruise")
actors2.insert("Nicolas Cage")
actors2.insert("Samuel Jackson")

print(actors2)


//Enums
enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = .tuesday
day = .friday
