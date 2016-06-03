//
//  SPFViewController.m
//  StockPriceFetcher
//
//  Created by Justin Driscoll on 9/3/12.
//  Copyright (c) 2012 Justin Driscoll. All rights reserved.
//

#import "SPFViewController.h"
#import "SPFPriceFetcher.h"


@interface SPFViewController ()
@property (strong, nonatomic) SPFPriceFetcher *quoter;
@end


@implementation SPFViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.stockSymbolTextField becomeFirstResponder];
}

- (IBAction)getPrice:(id)sender {
    SPFQuoteRequestCompleteBlock callback = ^(BOOL wasSuccessful, NSDecimalNumber *price) {
        if (wasSuccessful) {
            self.priceLabel.text = [NSString stringWithFormat:@"Latest price: $%@", [price stringValue]];
        } else {
            self.priceLabel.text = @"Unable to fetch price. Try again.";
        }
    };

    [self.quoter requestQuoteForSymbol:self.stockSymbolTextField.text
                          withCallback:callback];
}

- (SPFPriceFetcher *)quoter
{
    if (!_quoter) {
        self.quoter = [[SPFPriceFetcher alloc] init];
    }

    return _quoter;
}

@end
