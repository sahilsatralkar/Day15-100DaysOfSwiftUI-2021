import UIKit
import Foundation

var greeting = "Hello, playground"

//Constants and variables
var name = "Sahil"
name = "Donny"

let user = "Paul"
print(user)

//Strings

var actor = "Daniel Craig"
actor = "\"Daniel Craig\""
actor = "James Bond 007🔫"
let actorReview = """
Daniel Craig is the best Bond ever.
Casino Royale is is his best movie.
"""
print(actorReview)
print(actorReview.count)
print(actor.hasPrefix("James"))

//Integers
var score = 10
score = score + 5
score += 10
print(score)
print(score % 5 == 0 )
score /= 5
print(score)
print(score.isMultiple(of: 2))
let num = Int.random(in: 0 ... 1_00_000)

//Decimals
let highScore : Double = 1.9

let weight : Float = 78.2

//Booleans
let gameOver : Bool = false
var passed = true
passed.toggle()
print(passed)

//Joining strings

let firstName = "Taylor"
let lastName = "Swift"
print(firstName + " " + lastName)

//Arrays

var colors = ["Red", "Green", "Blue"]
let marks = [34,34,23,56]

print(colors.first)
colors.append("Orange")
print(colors.count)

//Dictionary
var employee = [ "name" : "Sahil","City":"Sangli"]
print(employee["name", default: "Anonymous"])

//Sets

var numberSet = ([4,5,3,234,62])
print(numberSet)
print(numberSet.sorted())

//Enum
enum weekend {
    case saturday, sunday
}

var day : weekend
day = weekend.saturday

//Type annotations

var playerName : String = "Danny Rojas"
var luckyNumber : Int = 23
var albumNames : Array<String> = ["1989", "Red"]
var empDict : Dictionary<String,String> = ["name": "Ted Lasso"]
var bookLibrary : Set<String> = (["Laughter is the best medicine","The invisible man"])

var clues = ([String])()
clues.append("hmm... let me think")

//Conditions

let age = 19
if age > 18 {
    print("Eligible to vote")
    
} else {
    print("You are too young to vote!")
}

//Switch

enum dayTypes {
    case weekend, weekday
}

var forecast = dayTypes.weekend

switch forecast {
case .weekday :
    print("Busy busy busy")
case .weekend :
    print("Nothing to do")
}

//ternary operator
print( age >= 18 ? "Let her vote": "Not eligible")

//Loops

let gadgets = ["TV","Laptop","iPad","Monitor"]

for gadget in gadgets {
    print(gadget)
}


//Functions

func timeToSleep(time : String) -> String {
    if time == "11pm" {
        return "Yes"
    } else {
        return "No"
    }
}
print(timeToSleep(time: "11pm"))

//Returning multiple values from a function

func getUser() -> (firstName : String, lastName: String) {
    
    (firstName : "Sahil", lastName: "Satralkar")
}

let returnValue = getUser()
print(returnValue.firstName)

//customizing parameter labels

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

print(isUppercase("Catalina"))

func printTable(for table : Int) {
    for i in 1...10 {
        print(table*i)
    }
}

printTable(for: 4)

//default values for parameters

func greet(name: String, formal : Bool = false) {
    if formal {
        print("Hello \(name)")
    } else {
        print("Hi \(name)")
    }
}

greet(name: "Rachel")
greet(name : "Tim", formal: true)

//Handling errors

enum PasswordErrors : Error {
    case tooShort, tooEasy
}

func passwordCheck(for password: String) throws -> String {
    
    if password.count < 5 {
        throw PasswordErrors.tooShort
    }
    else if password == "abcd"  {
        throw PasswordErrors.tooEasy
    }
    else {
        return "OK"
    }
}

do {
    let result = try passwordCheck(for: "abcd")
    print("Result is \(result)")
} catch PasswordErrors.tooEasy {
        print("Choose a long password ")
} catch {
    print("Error!!")
}

//Closures

var closure : () -> Void = {
    print("How are you?")
}
closure()

let sayHelloToPerson = {
    (name : String) -> String in
        "Hello \(name)"
}

sayHelloToPerson("Arsene")

let team = ["Gloria","Suzanne","Tiffany","Tasha"]

let onlyT = team.filter({(name: String) -> Bool in
     name.hasPrefix("T")
})

let a = onlyT

//Structs

struct Album {
    var name : String
    var releaseYear : Int
    var artist : String
    var isReleased : Bool
    
    func printSummary() {
        print("\(name) by \(artist)")
    }
    mutating func removeFromSale (){
        self.isReleased = false
        print("Album is removed from sale")
    }
}

var red = Album(name: "Red", releaseYear: 2021, artist: "Taylor Swift", isReleased: true)
red.printSummary()
red.removeFromSale()


//Computed properties
struct Employee {
    var name : String
    var vacationAllocated = 14
    var vacationTaken = 0
    var vacationRemaining : Int {
        return vacationAllocated - vacationTaken
    }
    
    var vacationRemaining2 : Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            vacationTaken = vacationAllocated - newValue
        }
    }
}

//Property observers
struct Game {
    var score = 0 {
        didSet {
            print("Old value is \(oldValue)")
        }
        willSet {
            print("New value is \(newValue)")
        }
    }
}

var game = Game()
game.score += 1

//Custom initializers

struct Player {
    var name : String
    var number : Int
    
    init(name : String) {
        self.name = name
        self.number = Int.random(in: 1...99)
    }
}

//Access control

struct BankAccount {
    private (set) var funds = 0
    
    mutating func deposit(amount : Int ) {
        funds += amount
    }
    
    mutating func withdraw(amount : Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

//static properties and methods

struct AppData {
    static let version = "1.5.2"
    static let setings = "Settings.json"
}

//Classes

class Employees {
    var hours : Int
    
    init(hours : Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I am working for \(hours) hrs")
    }
}

class Developer : Employees {
    func work() {
        print("I am coding for \(hours) hrs")
    }
    override func printSummary() {
        print("I am a developer, coding for \(hours)hrs")
    }
}

let andy = Developer(hours: 19)
andy.work()
andy.printSummary()

let brian = Employees(hours: 13)
brian.printSummary()

class User {
    
    let id : Int
    
    init(id : Int) {
        self.id = id
        print("User id is \(id)")
    }
    deinit {
        print("User \(id) is no longer exists")
    }
}

for i in 1...3 {
    let user1 = User(id: i)
    print("User: \(user1.id) : is in control")
}

protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car : Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I am driving \(distance)km")
    }
    
}

func commute(distance: Int, with vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("Too slow!")
    } else {
        vehicle.travel(distance: distance)
    }
}
let car = Car()

commute(distance: 10000, with: car)

protocol Vehicle2 {
    var name: String {get}
    var currentPassengers : Int {get set}
    func estimateTime(for distance: Int) -> Int
    func travel (distance: Int)
}

struct Car2 : Vehicle2 {
    var name: String
    
    var currentPassengers: Int
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I am driving \(distance)km")
    }
    
}
func commute2(distance: Int, with vehicle: Vehicle2) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("Too slow!")
    } else {
        vehicle.travel(distance: distance)
    }
}
let car2 = Car2(name: "Tesla", currentPassengers: 3)
commute2(distance: 212, with: car2)

//Extensions

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

var quote = "   The truth is rarely pure and never simple  "
let trimmed = quote.trimmed()

extension String {
    mutating func trim() {
        self = self.trimmed()
    }
}
quote.trim()

extension String {
    var lines : [String] {
        self.components(separatedBy : .newlines)
    }
}
let lyrics = """
Every breath you take
every move you make
"""

lyrics.lines.count

extension Collection {
    var isNotEmpty : Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Peach"]
guests.isNotEmpty

//OPtionals

let opposites = ["Mario" : "Wario", "Luigi":"Waluigi"]
if let peachOpposites = opposites["Peach"] {
    print("Here comes Peach!")
} else {
    print("Peach isnt here!")
}

func printSquare(of Number: Int?) {
    guard let number = Number else {
        print("Missing input")
        return
    }
    
    print("\(number) x \(number) is \(number*number)")
}

//nil coalescing

let tvshows = ["Breaking Bad","24"]
let favouriteshow = tvshows.randomElement() ?? "None"

//Optional chaining

let names = ["Ross","Phoebe","Chandler","Rachel"]
let chosen = names.randomElement()?.uppercased()
print("Next in line : \(chosen ?? "No One is chosen!") ")

//Optional try

enum UserError: Error {
    case badID, networkFailed, spinningBeachBall
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}
