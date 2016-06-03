# OSX-Singleton
The standard way of creating a singleton is like...

Singleton.h
```
@interface MySingleton : NSObject

+ (MySingleton*)sharedInstance;

@end
```

Singleton.m
```
#import "MySingleton.h"

@implementation MySingleton

#pragma mark - singleton method

+ (MySingleton*)sharedInstance
{
    static dispatch_once_t predicate = 0;
    __strong static id sharedObject = nil;
    //static id sharedObject = nil;  //if you're not using ARC
    dispatch_once(&predicate, ^{
        sharedObject = [[self alloc] init];
        //sharedObject = [[[self alloc] init] retain]; // if you're not using ARC
    });
    return sharedObject;
}

@end
```

Refernece - http://stackoverflow.com/questions/15383452/objective-c-sample-singleton-implementation
