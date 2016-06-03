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

@end

@implementation EventSender

- (id)init
{
    self = [super init];
    if (self) {
        _message = @"Hi, I'm Soaurabh";
    }
    return self;
}

-(void)startSomeProcess
{
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(pushMessage) userInfo:nil repeats:YES];
}

- (void) pushMessage {
    if ([[self delegate] respondsToSelector:@selector(event:)]) {
        [self.delegate event:self];  //this will call the method implemented in your other class
    }
}

@end
