//
//  AppDelegate.m
//  WorkingWithBlocks
//
//  Created by Soaurabh Kakkar on 29/07/16.
//  Copyright (c) 2016 Soaurabh Kakkar. All rights reserved.
//

#import "AppDelegate.h"
#import "EventSender.h"
#import "FirstEventListener.h"
#import "SecondEventListener.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (readonly) EventSender *eventSender;
@property (readonly) FirstEventListener *firstListener;
@property (readonly) SecondEventListener *secondListener;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    _eventSender = [[EventSender alloc] initWithTimeInterval:2];
    _firstListener = [[FirstEventListener alloc] initWithEventSender:_eventSender];
    _secondListener = [[SecondEventListener alloc] initWithEventSender:_eventSender];
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
