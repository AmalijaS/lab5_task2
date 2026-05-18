#import "ArrayFilter.h"

@implementation ArrayFilter

- (NSArray<NSNumber *> *)filterNumbersGreaterThan10:(NSArray<NSNumber *> *)numbers {
    NSMutableArray *result = [NSMutableArray array];
    for (NSNumber *num in numbers) {
        if ([num integerValue] > 10) {
            [result addObject:num];
        }
    }
    return [result copy]; // возвращаем неизменяемый массив
}

- (void)demonstrateAllOperations {
    // создание пустого изменяемого массива
    NSMutableArray *marr = [NSMutableArray array];
    
    // ввод с консоли
    printf("Введите числа через пробел, окончание - Enter:\n");
    char input[100];
    fgets(input, 100, stdin);
    NSString *str = [NSString stringWithUTF8String:input];
    NSArray *items = [str componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    for (NSString *item in items) {
        if ([item length] > 0) {
            NSNumber *num = @([item intValue]);
            [marr addObject:num];
        }
    }
    NSLog(@"После ввода: %@", marr);
    
    // подсчёт количества
    NSLog(@"Количество элементов: %lu", (unsigned long)[marr count]);
    
    // добавление элемента
    [marr addObject:@100];
    NSLog(@"Добавили 100: %@", marr);
    
    // вставка по индексу
    [marr insertObject:@99 atIndex:1];
    NSLog(@"Вставили 99 на позицию 1: %@", marr);
    
    // удаление последнего
    [marr removeLastObject];
    NSLog(@"Удалили последний: %@", marr);
    
    // удаление по индексу
    if ([marr count] > 2) {
        [marr removeObjectAtIndex:2];
        NSLog(@"Удалили элемент с индексом 2: %@", marr);
    }
    
    // удаление всех
    [marr removeAllObjects];
    NSLog(@"После удаления всех: %@", marr);
}
@end
