//
//  AppDelegate.h
//  DelegateExample
//
//  Created by Soaurabh Kakkar on 29/07/16.
//  Copyright (c) 2016 Soaurabh Kakkar. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class FirstEventListener, SecondEventListener;
@interface AppDelegate : NSObject <NSApplicationDelegate>{
    FirstEventListener *_firstListener;
    SecondEventListener *_secondListener;
}

@end

