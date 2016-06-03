//
//  FirstEventListener.h
//  
//
//  Created by Soaurabh Kakkar on 29/07/16.
//
//

#import <Foundation/Foundation.h>
#import "EventSender.h"

@interface FirstEventListener : NSObject<EventSenderDelegate>{
    EventSender *event;
}

@end
