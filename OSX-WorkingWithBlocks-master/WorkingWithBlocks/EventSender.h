//
//  EventSender.h
//  
//
//  Created by Soaurabh Kakkar on 29/07/16.
//
//

#import <Foundation/Foundation.h>

typedef void (^ESRequestCompleteBlock) (NSString *msg);
typedef enum {
    kMsgEvent = 0,
    kTimeEvent = 1
} EventType;

@interface EventSender : NSObject

-(id) initWithTimeInterval:(NSTimeInterval)t;
- (void) giveResponse:(ESRequestCompleteBlock) callback;
- (void) giveResponseWithType:(EventType)type callback:(ESRequestCompleteBlock) callback;

@end
