//
//  EventSenderProtocol.h
//  DelegateExample
//
//  Created by Soaurabh Kakkar on 29/07/16.
//  Copyright (c) 2016 Soaurabh Kakkar. All rights reserved.
//

#ifndef DelegateExample_EventSenderProtocol_h
#define DelegateExample_EventSenderProtocol_h

@class EventSender;
@protocol EventSenderDelegate <NSObject>   //define delegate protocol
- (void) event: (EventSender*) sender;  //define delegate method to be implemented within another class
@end //end protocol

#endif
