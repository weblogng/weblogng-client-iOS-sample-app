//
//  WNGMainViewController.h
//  sample-app
//
//  Created by Stephen Kuenzli on 12/28/13.
//  Copyright (c) 2013, 2014 WeblogNG. All rights reserved.
//

#import "WNGFlipsideViewController.h"

@interface WNGMainViewController : UIViewController <WNGFlipsideViewControllerDelegate, UIPopoverControllerDelegate, NSURLConnectionDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

- (IBAction)sendMetric:(id)sender;

- (IBAction)makeRequest:(id)sender;

@end
