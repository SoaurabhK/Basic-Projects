//
//  FirstEventListener.m
//  
//
//  Created by Soaurabh Kakkar on 29/07/16.
//
//

#import "FirstEventListener.h"

@implementation FirstEventListener

-(id)initWithEventSender:(EventSender*)eventSender {
    self = [super init];
    if (self) {
        [eventSender giveResponse:^(NSString *msg) {
            NSLog(@"Got the response in first- %@", msg);
        }];
        [eventSender giveResponseWithType:kMsgEvent callback:^(NSString *msg) {
            NSLog(@"Got the response in first with msg type - %@", msg);
        }];
    }
    return self;
}
@end
