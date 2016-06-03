//
//  EventSender.h
//  
//
//  Created by Soaurabh Kakkar on 29/07/16.
//
//

#import <Foundation/Foundation.h>
#import "EventSenderDelegate.h"

@interface EventSender : NSObject

@property (nonatomic, weak) id<EventSenderDelegate> delegate;

-(void)startSomeProcess;

@end
