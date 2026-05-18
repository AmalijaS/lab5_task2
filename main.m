#import <Foundation/Foundation.h>
#import "ArrayFilter.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *numbers = @[@5, @15, @25, @3, @20];
        ArrayFilter *filter = [[ArrayFilter alloc] init];
        NSArray *filtered = [filter filterNumbersGreaterThan10:numbers];
        
        NSLog(@"Исходный массив: %@", numbers);
        NSLog(@"Отфильтрованный (>10): %@", filtered);
    }
    return 0;
}
