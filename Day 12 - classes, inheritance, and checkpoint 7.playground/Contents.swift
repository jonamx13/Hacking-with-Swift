import UIKit

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

//Class inheritance
class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

final class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times will spend hours arguing about whether code should be indented using tabs or spaces")
    }
}

final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

let novall = Developer(hours: 8)
novall.printSummary()

//Initializers for classes
class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
    
}

//We provide the superclass initializer with "super" keyword on subclasses
class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

//When we define default values for new properties in our subclass,
//we don't need to pass the superclass initializer, it runs it by default
class CarNonConvertible: Vehicle {
    let isConvertible = false
}

let teslaX = Car(isElectric: true, isConvertible: false)
let anotherTeslaX = CarNonConvertible(isElectric: true)

// Copying classes
class User {
    var username = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1.copy()
user2.username = "Taylor Swift"

print(user1.username)
print(user2.username)

//Deinitializers for classes

class UserDeinit {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        print("User \(id): I'm dead!")
    }
}

var users = [UserDeinit]()

for i in 1...3 {
    let user = UserDeinit(id: i)
    print("User \(user.id): I'm in control")
    users.append(user)
}

print("Loop is finished")
users.removeAll()
print("Array is clear")

//Variables in classes
/*
 
 - Variable classes can have variable properties changed
 - Constant classes can have variable properties changed
 - Variable structs can have variable properties changed
 - Constant structs cannot have variable properties changed
 
 */

class UserVar {
    var name = "Paul"
}

var userVar = UserVar()
userVar.name = "Taylor"
print(userVar.name)
userVar = UserVar()
print(userVar.name)

//CHECKPOINT 7
/*
 -Make a class hierarchy for animals.
    -Start with "Animal". Add a "legs" property for the number of legs an animal has
    -Make "Dog" a subclass of "Animal", giving it a "speak()" method that prints a dog
    barking string, but each subclass should print something different.
    -Make "Corgi" and "Poodle" subclasses of "Dog".
    -Make "Cat" an "Animal" subclass. Add a "speak()" method, with each subclass
    printing something different, and an "isTame" Boolean, set with initializer.
    -Make "Persian" and "Lion" as subclasses of "Cat".
 */

class Animal {
    var legsCount: Int = 4
}

//Dog subclasses
class Dog: Animal {
    let bark: String = "Woof! woof!"

    
    func speak() {
        print(bark)
    }
    
}

class Corgi: Dog {
    private let barkingInCorgi: String = "(in Corgi)"
    
    override func speak() {
        print("\(bark) \(barkingInCorgi)")
    }
}

class Poodle: Dog {
    private let barkingInPoodle: String = "(in Poodle)"
    
    override func speak() {
        print("\(bark) \(barkingInPoodle)")
    }
}

// Cat subclasses
class Cat: Animal {
    let meow: String
    var isTame: Bool
    
    init(isTame: Bool, _ meowing: String = "Meow! Meow!") {
        meow = meowing
        self.isTame = isTame
        super.init()
    }
    
    func speak() {
        print(meow)
    }
}

class Persian: Cat {
    private let meowInPersian: String = "(in Persian)"
    
    override func speak() {
        print("\(meow) \(meowInPersian)")
    }
}

//Here we override its init for the proper sound of a Lion
class Lion: Cat {
    private let meowInLion: String
    
    override init(isTame: Bool, _ meowing: String = "Roar! Roar!") {
        self.meowInLion = "(meow in Lion)"
        super.init(isTame: isTame, meowing)
    }
    
    override func speak() {
        print("\(meow) \(meowInLion)")
    }
    
    
}

//Dog tests
var newDog = Dog()
newDog.speak()
print("New dog with \(newDog.legsCount) legs")

var newCorgi = Corgi()
newCorgi.speak()
newCorgi.legsCount = 3
print("New Corgi dog with \(newCorgi.legsCount) legs")

var newPoodle = Poodle()
newPoodle.speak()
newPoodle.legsCount = 5
print("New Poodle dog with \(newPoodle.legsCount) legs")

//Cat tests
var newCat = Cat(isTame: true)
newCat.speak()
print("New cat with \(newCat.legsCount) legs")

var newPersian = Persian(isTame: true)
newPersian.speak()
newPersian.legsCount = 5
print("New Persian cat with \(newPersian.legsCount) legs")

var newLion = Lion(isTame: false)
newLion.speak()
print("A lion meows like... \(newLion.meow)")
newLion.legsCount = 6
print("New Lion with \(newLion.legsCount) legs")
