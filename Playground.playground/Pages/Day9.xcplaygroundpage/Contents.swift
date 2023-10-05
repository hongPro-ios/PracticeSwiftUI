let sayHello = { (name: String) -> String in
"Hi \(name)!"}


func greetUser() {
    print("Hi there!")
}

var greetCopy: () -> () = greetUser

print(type(of: greetCopy))

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

let team = ["a", "b", "c", "d"]

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "d" {
        return true
    } else if name2 == "a" {
        return false
    }
    return name1 < name2
}

let captainFirstTeam = team.sorted(by: captainFirstSorted)

print(captainFirstTeam)

let sampleClosure = { (name1: String) in
    print(name1)
}

let setItems = Set([1, 3, 5, 6])

print(setItems.map { "\($0)" })


func doImportWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
}

doImportWork {
    print("first")
} second: {
    print("second")
} third: {
    print("third")
}

//var makeFromStraw = {
//    print("Let's build it out of straw")
//}
func buildHouse(using buildingStyle: @escaping () -> Void) {
    buildingStyle
    print("It's ready - can anyone blow it down?")
    var makeFromStraw = {
        print("Let's build it out of straw")
    }
    makeFromStraw = buildingStyle
}

// MARK: - Checkpoint 5

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

// Filter out any numbers that are even
// Sort the array in ascending order
// Map them to strings in the format "7 is a lucky number

let result = luckyNumbers
    .filter { !($0.isMultiple(of: 2))}
    .sorted(by: <)
    .map { "\($0) is a lucky number" }


// Print the resulting array, one item per line
result.forEach { print($0) }
