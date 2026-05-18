import Foundation

func checkNumber(_ n: Int, a: Int) -> (by3: Bool, byA: Bool) {
    let digits = String(n).compactMap { Int(String($0)) }
    let product = digits.reduce(1, *)
    return (product % 3 == 0, product % a == 0)
}

// Примеры тестов
let testNumbers = [(1234, 2), (4321, 5), (2222, 2), (1111, 3)]
for (num, a) in testNumbers {
    let result = checkNumber(num, a: a)
    print("Число \(num), a = \(a): произведение = \(String(num).compactMap{Int(String($0))}.reduce(1,*)), кратно 3? \(result.by3), кратно \(a)? \(result.byA)")
}
