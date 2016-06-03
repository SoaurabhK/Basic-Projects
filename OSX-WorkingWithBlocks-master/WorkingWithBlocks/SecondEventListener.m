//
//  SecondEventListener.m
//  
//
//  Created by Soaurabh Kakkar on 29/07/16.
//
//

#import "SecondEventListener.h"

@implementation SecondEventListener

-(id)initWithEventSender:(EventSender*)eventSender {
    self = [super init];
    if (self) {
        [eventSender giveResponse:^(NSString *msg) {
            NSLog(@"Got the response in second - %@", msg);
        }];
    }
    return self;
    
}
@end
