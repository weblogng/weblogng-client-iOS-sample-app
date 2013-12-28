//
//  WNGFlipsideViewController.h
//  sample-app
//
//  Created by Stephen Kuenzli on 12/28/13.
//  Copyright (c) 2013 Weblog-NG. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WNGFlipsideViewController;

@protocol WNGFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(WNGFlipsideViewController *)controller;
@end

@interface WNGFlipsideViewController : UIViewController

@property (weak, nonatomic) id <WNGFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
