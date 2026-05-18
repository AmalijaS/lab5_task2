import Foundation
import ZooCore   // импортируем наш модуль

// Инициализация первого словаря (пустого)
var manager = ZooManager()

// Инициализация второго словаря с начальными данными (по варианту 21 – можно добавить пару зоопарков)
manager.addOrUpdate(zoo: "Московский зоопарк", animals: 8000, city: "Москва")
manager.addOrUpdate(zoo: "Ленинградский зоопарк", animals: 2500, city: "Санкт-Петербург")
manager.addOrUpdate(zoo: "Новосибирский зоопарк", animals: 11000, city: "Новосибирск")

// Функция вывода меню
func showMenu() {
    print("""
    
    ========== МЕНЮ ==========
    1. Вывести все зоопарки
    2. Найти зоопарк по названию
    3. Добавить / изменить зоопарк
    4. Удалить зоопарк
    5. Удалить все зоопарки
    6. Количество зоопарков
    7. Сортировка по названию (ключу)
    8. Сортировка по количеству животных (значению)
    0. Выход
    Выберите пункт:
    """)
}

// Основной цикл
var shouldExit = false
while !shouldExit {
    showMenu()
    guard let input = readLine(), let choice = Int(input) else {
        print("Ошибка: введите число.")
        continue
    }
    
    switch choice {
    case 1:
        manager.showAllZoos()
        
    case 2:
        print("Введите название зоопарка:")
        guard let name = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines), !name.isEmpty else {
            print("Название не может быть пустым.")
            break
        }
        if let animals = manager.getAnimals(for: name), let city = manager.getCity(for: name) {
            print("\(name): \(animals) животных, город \(city)")
        } else {
            print("Зоопарк \"\(name)\" не найден.")
        }
        
    case 3:
        print("Название зоопарка:")
        let name = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        guard !name.isEmpty else {
            print("Название не может быть пустым.")
            break
        }
        print("Количество животных (целое число):")
        let animalsStr = readLine() ?? ""
        guard let animals = Int(animalsStr) else {
            print("Ошибка: введите целое число.")
            break
        }
        print("Город:")
        let city = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        manager.addOrUpdate(zoo: name, animals: animals, city: city)
        
    case 4:
        print("Название зоопарка для удаления:")
        let name = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        manager.remove(zoo: name)
        
    case 5:
        manager.removeAll()
        
    case 6:
        print("Количество зоопарков: \(manager.animalsCount)")
        
    case 7:
        let sorted = manager.sortedByKey()
        if sorted.isEmpty {
            print("Нет данных для сортировки.")
        } else {
            print("Сортировка по названию (ключу):")
            for item in sorted {
                print("\(item.key): \(item.animals) животных, г. \(item.city)")
            }
        }
        
    case 8:
        let sorted = manager.sortedByAnimals()
        if sorted.isEmpty {
            print("Нет данных для сортировки.")
        } else {
            print("Сортировка по количеству животных (значению):")
            for item in sorted {
                print("\(item.key): \(item.animals) животных, г. \(item.city)")
            }
        }
        
    case 0:
        shouldExit = true
        print("До свидания!")
        
    default:
        print("Неверный пункт. Введите число от 0 до 8.")
    }
}
