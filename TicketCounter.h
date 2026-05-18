#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TicketCounter : NSObject

// Публичный метод: подсчитать количество билетов с суммой трёх цифр = targetSum
- (NSInteger)countLuckyTicketsWithSum:(NSInteger)targetSum;

// Приватный метод (объявлен в .m, но можно через extension)
@end

NS_ASSUME_NONNULL_END
