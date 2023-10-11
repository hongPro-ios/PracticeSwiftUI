struct Employee {
    let name: String
    var vacationRemaining: Int

    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
        } else {
            print("Oops")
        }

    }
}


var archer = Employee(name: "hong", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

struct Employee2 {
    let name: String
    var vacationRemaining: Int

    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
        } else {
            print("Oops")
        }

    }
}

struct BankAccount {
    var name: String
    var isMillionnaire = false
    var balance: Int {
        didSet {
            if balance > 1_000_000 {
                isMillionnaire = true
                balance = 5
                print(balance)
            } else {
                isMillionnaire = false
                print(balance)
            }
        }
    }
}

var bankAccount = BankAccount(name: "name", isMillionnaire: true, balance: 1)
bankAccount.balance = 1000000000

