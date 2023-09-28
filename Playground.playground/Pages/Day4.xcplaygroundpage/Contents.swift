let strings: [String] = ["test1", "test2", "test1"]
strings.forEach {
    print($0)
}
let uniqueStrings = Set(strings)
uniqueStrings.forEach {
    print($0)
}
