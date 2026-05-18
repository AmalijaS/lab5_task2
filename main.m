#import <Foundation/Foundation.h>
#import "TicketCounter.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TicketCounter *counter = [[TicketCounter alloc] init];
        NSInteger result = [counter countLuckyTicketsWithSum:13];
        NSLog(@"Количество счастливых билетов с суммой 13: %ld", (long)result);
    }
    return 0;
}
