import Foundation

func checkNumber(_ n: Int, a: Int) -> (by3: Bool, byA: Bool) {
    let digits = String(n).compactMap { Int(String($0)) }
    let product = digits.reduce(1, *)
    return (product % 3 == 0, product % a == 0)
}

print("Введите четырёхзначное число:")
if let input = readLine(), let n = Int(input), (1000...9999).contains(n) {
    print("Введите число a:")
    if let aInput = readLine(), let a = Int(aInput) {
        let result = checkNumber(n, a: a)
        print("Произведение цифр кратно 3: \(result.by3)")
        print("Произведение цифр кратно \(a): \(result.byA)")
    } else {
        print("Некорректное a")
    }
} else {
    print("Некорректное число")
}
