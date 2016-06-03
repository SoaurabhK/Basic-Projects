//
//  SPFViewController.h
//  StockPriceFetcher
//
//  Created by Justin Driscoll on 9/3/12.
//  Copyright (c) 2012 Justin Driscoll. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SPFViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UITextField *stockSymbolTextField;

- (IBAction)getPrice:(id)sender;

@end
