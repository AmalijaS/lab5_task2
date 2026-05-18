#import "TicketCounter.h"

@interface TicketCounter ()
- (NSInteger)sumOfDigitsOfThreeDigitNumber:(NSInteger)number;
@end

@implementation TicketCounter

// Вспомогательный метод: сумма трёх цифр (число от 0 до 999)
- (NSInteger)sumOfDigitsOfThreeDigitNumber:(NSInteger)number {
    NSInteger hundreds = number / 100;
    NSInteger tens = (number % 100) / 10;
    NSInteger units = number % 10;
    return hundreds + tens + units;
}

- (NSInteger)countLuckyTicketsWithSum:(NSInteger)targetSum {
    NSInteger count = 0;
    // Перебираем все комбинации первых трёх цифр (0-999) и последних трёх (0-999)
    for (NSInteger first = 0; first <= 999; first++) {
        NSInteger sumFirst = [self sumOfDigitsOfThreeDigitNumber:first];
        if (sumFirst != targetSum) continue;
        for (NSInteger second = 0; second <= 999; second++) {
            NSInteger sumSecond = [self sumOfDigitsOfThreeDigitNumber:second];
            if (sumSecond == targetSum) {
                count++;
            }
        }
    }
    return count;
}
@end
