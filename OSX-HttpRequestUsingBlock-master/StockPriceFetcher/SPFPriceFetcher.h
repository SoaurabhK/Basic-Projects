//
//  SPFPriceFetcher.h
//  StockPriceFetcher
//
//  Created by Justin Driscoll on 9/3/12.
//  Copyright (c) 2012 Justin Driscoll. All rights reserved.
//

#import <Foundation/Foundation.h>



typedef void (^SPFQuoteRequestCompleteBlock) (BOOL wasSuccessful, NSDecimalNumber *price);

@interface SPFPriceFetcher : NSObject

- (void)requestQuoteForSymbol:(NSString *)symbol
                 withCallback:(SPFQuoteRequestCompleteBlock)callback;

@end

