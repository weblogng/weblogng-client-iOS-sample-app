//
//  WNGAppDelegate.m
//  sample-app
//
//  Created by Stephen Kuenzli on 12/28/13.
//  Copyright (c) 2013 Weblog-NG. All rights reserved.
//

#import "WNGAppDelegate.h"

#import <WNGLogger/logger.h>

@implementation WNGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //93c5a127-e2a4-42cc-9cc6-cf17fdac8a7f - account 1
    //f37d4458-4fcd-4a4c-93e5-3a5fdd499ed1 - account 9
    NSString *apiKey = @"93c5a127-e2a4-42cc-9cc6-cf17fdac8a7f";

    [WNGLogger initSharedLogger:apiKey];
    
    [self someIntensiveLogic];
    
    return YES;
}

- (IBAction) someIntensiveLogic {
    NSString *metricName = @"sample-app-someIntensiveLogic";
    [[WNGLogger sharedLogger] recordStart:metricName];
    
    int millis_to_sleep = 500 + arc4random_uniform(250);
    float seconds_to_sleep = ((float) millis_to_sleep) / 1000;
    
    [NSThread sleepForTimeInterval:seconds_to_sleep];
    
    [[WNGLogger sharedLogger] recordFinishAndSendMetric:metricName];
    
    [[WNGLogger sharedLogger] executeWithTiming:@"sample-app-anExpensiveBlock" aBlock:^(void){
        int millis_to_sleep = 250 + arc4random_uniform(250);
        float seconds_to_sleep = ((float) millis_to_sleep) / 1000;
        [NSThread sleepForTimeInterval:seconds_to_sleep];
    }];
}



@end
