# OSX-AvoidRetainCycleInBlock
Avoiding RetainCycles in Blocks

```
__weak MyClass *weakSelf = self;

[tapBlockView setTapBlock:^(UIImage* image) {
    __strong MyClass *strongSelf = weakSelf;
    if(strongSelf) {
        [strongSelf.myImageArray addObject:image];
    }
}];
```

The reason for the cast back to __strong is to guarantee that if weakSelf is still alive when the first line of the block is executed, it will continue to live for the remainder of the execution of the block.

References -
http://stackoverflow.com/questions/13257356/what-is-the-proper-way-to-avoid-retain-cycle-while-using-blocks

http://stackoverflow.com/questions/29918676/ios-blocks-avoid-retain-cycles

http://www.logicsector.com/ios/avoiding-objc-retain-cycles-with-weakself-and-strongself-the-easy-way/

http://www.cocoawithlove.com/2009/07/rules-to-avoid-retain-cycles.html

