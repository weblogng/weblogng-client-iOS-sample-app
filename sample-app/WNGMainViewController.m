//
//  WNGMainViewController.m
//  sample-app
//
//  Created by Stephen Kuenzli on 12/28/13.
//  Copyright (c) 2013 Weblog-NG. All rights reserved.
//

#import "WNGMainViewController.h"
#import <WNGLogger/logger.h>

@interface WNGMainViewController ()

@end

@implementation WNGMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendMetric:(id)sender
{
    NSLog(@"sendMetric callback triggered");
    [[WNGLogger sharedLogger] executeWithTiming:@"sample-app-controller-callback" aBlock:^(void){
        int millis_to_sleep = 250 + arc4random_uniform(250);
        float seconds_to_sleep = ((float) millis_to_sleep) / 1000;
        [NSThread sleepForTimeInterval:seconds_to_sleep];
    }];

}


#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(WNGFlipsideViewController *)controller
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
    }
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.flipsidePopoverController = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
            self.flipsidePopoverController = popoverController;
            popoverController.delegate = self;
        }
    }
}

- (IBAction)togglePopover:(id)sender
{
    if (self.flipsidePopoverController) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    } else {
        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
    }
}

@end
