enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 { throw PasswordError.short}
    if password == "1234" { throw PasswordError.obvious }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}


// MARK: - Checkpoint 4
enum CustomError: Error {
    case outOfBounds
    case noRoot
}

func square(_ number: Int) throws -> Int {
    guard 1 <= number, 10000 >= number else {
        throw CustomError.outOfBounds
    }
    let rootedValue = (1...100).first { $0 * $0 == number }

    if let value = rootedValue {
        return value
    } else {
        throw CustomError.noRoot
    }
}

try? square(10000)
