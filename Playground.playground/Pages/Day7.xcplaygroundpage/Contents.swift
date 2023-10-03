let a = "test"
let b = "test"

func judge(a: String, b: String) -> Bool {
    a == b
}

judge(a: a, b: b)


func getUser3() -> (firstName: String, lastName: String) {
    ("hong", "jeongesob")
}

var (q, i) = getUser3()
print(q)
