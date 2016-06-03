//
//  AppDelegate.m
//  DelegateExample
//
//  Created by Soaurabh Kakkar on 29/07/16.
//  Copyright (c) 2016 Soaurabh Kakkar. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstEventListener.h"
#import "SecondEventListener.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    _firstListener = [[FirstEventListener alloc] init];
    _secondListener = [[SecondEventListener alloc] init];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
