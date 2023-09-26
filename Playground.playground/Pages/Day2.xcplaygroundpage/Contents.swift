import Cocoa

var gameOver = true

gameOver.toggle()
gameOver = !gameOver

// MARK: CheckPoint 1

// Creates a constant holding any temperature in Celsius.
let celsius: Double = 100
// Converts that temperature to Fahrenheit by multiplying by 9, dividing by 5, then adding 32.
var fahrenheit: Double { celsius * 9 / 5 + 32 }
// Prints the result, showing both the Celsius and Fahrenheit values.
print("\(fahrenheit)°F")

struct Person: Encodable {
    let name: String
    let age: Int
}


extension String.StringInterpolation {
    mutating func appendInterpolation<T: Encodable>(debug value: T) {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        if let result = try? encoder.encode(value) {
            let str = String(decoding: result, as: UTF8.self)
            appendLiteral(str)
        }
    }
}

let person1 = Person(name: "aef", age: 123)

print("person1: \(debug: person1)")
print("person1: \(person1)")
