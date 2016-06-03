# OSX-WorkingWithDelegates

Note -
If an object has more than one distinct event, use delegation.

Since an object can only have one delegate, it can really only talk to that one delegate and nobody else.

If an object is a singleton, we can't use delegation.
Let's look at CLLocationManager here. The location manager will tell one object (and only one object) when a location is found. Of course, if we need more than one object to know about these updates, we'd probably create another location manager.

Delegates work well when two objects need to have an ongoing or broad relationship and the UITableView delegate is a great example of this.

Thus, we can say that delegate callbacks are more process oriented and blocks are more results oriented. If you need to be informed along the way of a multi-step process, you'll probably want to use delegation. If you just want the information you are requesting (or details about a failure to get the information), you should use a block. (If you combine this with item 3 in this list, you'll realize that the delegate can maintain state across all of these events whereas multiple stand-alone blocks could not.)

Two way communication for data interchange -> Both objects should be part of the same module

One way communication from A to B (With Response)-> Use Blocks for async callbacks(Result oriented, not events oriented)

One way communication from A to B (With Response) -> Use Delegation for async callbacks(Process/Events oriented, if by using delegation one can listen for events happening through the process)

Want Speed of execution use blocks purely, but beware about retain cycle i.e memory management


References -
http://stackoverflow.com/questions/626898/how-do-i-create-delegates-in-objective-c

http://blog.stablekernel.com/blocks-or-delegates/

http://themainthread.com/blog/2012/09/communicating-with-blocks-in-objective-c.html

http://stackoverflow.com/questions/4584404/do-code-blocks-completely-replace-delegates/

https://maniacdev.com/2011/07/tutorial-objective-c-blocks-closures-for-beginners

https://maniacdev.com/2010/07/blocks-an-interesting-objective-c-addition-in-ios-4

http://pragmaticstudio.com/blog/2010/7/28/ios4-blocks-1

http://pragmaticstudio.com/blog/2010/9/15/ios4-blocks-2

http://www.ios-blog.co.uk/tutorials/programming-with-blocks-an-overview/

https://www.raywenderlich.com/9438/how-to-use-blocks-in-ios-5-tutorial-part-2

https://www.quora.com/When-and-why-should-one-use-blocks-vs-delegates-in-Objective-C

https://www.objc.io/issues/7-foundation/communication-patterns/

https://www.raywenderlich.com/46988/ios-design-patterns
