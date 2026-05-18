#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArrayFilter : NSObject

// Принимает NSArray чисел, возвращает NSArray чисел > 10
- (NSArray<NSNumber *> *)filterNumbersGreaterThan10:(NSArray<NSNumber *> *)numbers;

@end

NS_ASSUME_NONNULL_END
