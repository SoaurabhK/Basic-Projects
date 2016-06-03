//
//  EventSender.m
//  
//
//  Created by Soaurabh Kakkar on 29/07/16.
//
//

#import "EventSender.h"

@interface EventSender()

@property (readonly) NSString* message;
@property (readonly) NSMutableArray* callbacks;

@end

@implementation EventSender

-(id) initWithTimeInterval:(NSTimeInterval)t {
    self = [super init];
    if (self) {
        _message = @"Hi, I'm Soaurabh";
        _callbacks = [[NSMutableArray alloc] init];
        [self startSomeProcess:t];
    }
    return self;

}

-(void)startSomeProcess:(NSTimeInterval)t
{
    [NSTimer scheduledTimerWithTimeInterval:t target:self selector:@selector(pushMessage) userInfo:nil repeats:YES];
}

- (void) giveResponseWithType:(EventType)type callback:(ESRequestCompleteBlock) callback {
    switch (type) {
        case kMsgEvent:
            [_callbacks addObject:callback];
            break;
        case kTimeEvent:
            //we can implement this as well
            break;
        default:
            break;
    }
}

- (void) giveResponse:(ESRequestCompleteBlock) callback {
    [_callbacks addObject:callback];
}

- (void) pushMessage {
    for (ESRequestCompleteBlock callback in _callbacks) {
        callback(_message);
    }
}

@end
