
struct BankAccount {
    private(set) var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

print(account.funds)

// private: Don't let anything outside the struct use this.
// fileprivate Don't let anything outside the current file use this.
// public Let anyone, anywhere use this



// self: The current value of a struct
// Self: The current type of struct


// MARK: Checkpoint6

struct Car {
    private var numberOfSeats: Int
    private(set) var currentGear: Int

    mutating func setGear(gear: Int) {
        guard 1 > gear, 10 < gear else { return }
        currentGear = gear
    }
}

