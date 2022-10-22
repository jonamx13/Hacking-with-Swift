import UIKit

//For
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift work great on \(os).")
}

for i in 1...12 {
    print("The \(i) times table")
    
    for j in 1...12 {
        print("   \(j) x \(i) is \(j * i)")
    }
    print()
}

for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

for i in 1..<5 {
    print("Counting from 1 up to 5: \(i)")
}

var lyric = "Haters gonna"

for _ in 1...5{
    lyric += " hate"
}

print(lyric)

//While

var countdown = 10

while countdown < 0 {
    print("countdown")
    countdown -= 1
}

print("Blast off!!")

let id = Int.random(in: 1...1000)
let amount = Double.random(in: 1...10)

var roll = 0

while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

print("Critical hit!!!")

//Break and continue
let fileNames = ["me.jpg", "work.txt", "sophie.jpg"]

for filename in fileNames{
    if filename.hasSuffix(".jpg") == false {
        continue
    }
    print("Found picture: \(filename)")
}

var number1 = 4
var number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)
        if multiples.count == 10{
            break
        }
    }
}
print(multiples)

//CHECKPOINT 3
/*
 FIZZ - BUZZ
** If it’s a multiple of 3, print “Fizz”
** If it’s a multiple of 5, print “Buzz”
** If it’s a multiple of 3 and 5, print “FizzBuzz”
** Otherwise, just print the number.
*/

let fizzBuzzRange = 1...100
let fizzBuzz = (fizz: "Fizz",buzz: "Buzz")

// Module solution
for i in fizzBuzzRange {
    if i % 5 == 0 && i % 3 == 0 {
        print(fizzBuzz.fizz + fizzBuzz.buzz)
    } else if i % 3 == 0 {
        print(fizzBuzz.fizz)
    } else if i % 5 == 0 {
        print(fizzBuzz.buzz)
    } else {
        print(i)
    }
}

//isMultipleOf solution
for j in fizzBuzzRange {
    if j.isMultiple(of: 3) && j.isMultiple(of: 5) {
        print(fizzBuzz.fizz + fizzBuzz.buzz)
    } else if j.isMultiple(of: 3) {
        print(fizzBuzz.fizz)
    } else if j.isMultiple(of: 5) {
        print(fizzBuzz.buzz)
    } else {
        print(j)
    }
}

//Switch Solution
for k in fizzBuzzRange {
    let Fizz = k.isMultiple(of: 3) ? true : false
    let Buzz = k.isMultiple(of: 5) ? true : false
    var isFizzBuzz = (fizz: Fizz, buzz: Buzz)
    
    switch isFizzBuzz {
        case (true, true):
            print(fizzBuzz.fizz + fizzBuzz.buzz)
        case(true, false):
            print(fizzBuzz.fizz)
        case(false, true):
            print(fizzBuzz.buzz)
        default:
            print(k)
    }
}

//While Solution

var counter: Int = fizzBuzzRange.first!

while counter <= fizzBuzzRange.last!{
    var resultFizzBuzz: String
    if counter % 3 == 0 && counter % 5 == 0{
        resultFizzBuzz = "FizzBuzz"
    } else if counter % 3 == 0 {
        resultFizzBuzz = "Fizz"
    } else if counter % 5 == 0 {
        resultFizzBuzz = "Buzz"
    } else {
        resultFizzBuzz = String(counter)
    }
    print(resultFizzBuzz)
    counter += 1
}

