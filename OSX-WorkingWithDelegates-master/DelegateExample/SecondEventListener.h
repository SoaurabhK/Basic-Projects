//
//  SecondEventListener.h
//  
//
//  Created by Soaurabh Kakkar on 29/07/16.
//
//

#import <Foundation/Foundation.h>
#import "EventSender.h"

@interface SecondEventListener : NSObject<EventSenderDelegate>{
    EventSender *event;
}

@end
