//
//  SecondEventListener.m
//  
//
//  Created by Soaurabh Kakkar on 29/07/16.
//
//

#import "SecondEventListener.h"

@implementation SecondEventListener

- (instancetype)init
{
    self = [super init];
    if (self) {
        event = [[EventSender alloc] init];
        event.delegate = self;
        [event startSomeProcess];
    }
    return self;
}

- (void) event: (EventSender*) sender {
    NSLog(@"Delegates are fun in secondListener - %@", sender);
}

@end
