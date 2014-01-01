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

WNGLogger *logger;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSString *apiHost = @"ec2-174-129-123-237.compute-1.amazonaws.com:9000";
    //93c5a127-e2a4-42cc-9cc6-cf17fdac8a7f - account 1
    //f37d4458-4fcd-4a4c-93e5-3a5fdd499ed1 - account 9
    NSString *apiKey = @"93c5a127-e2a4-42cc-9cc6-cf17fdac8a7f";

    logger = [[WNGLogger alloc] initWithConfig:apiHost apiKey:apiKey];
    
    [self someIntensiveLogic];
    
    return YES;
}

- (void) someIntensiveLogic {
    NSString *metricName = @"sample-app-someIntensiveLogic";
    [logger recordStart:metricName];
    
    int millis_to_sleep = 500 + arc4random_uniform(250);
    float seconds_to_sleep = ((float) millis_to_sleep) / 1000;
    
    [NSThread sleepForTimeInterval:seconds_to_sleep];
    
    [logger recordFinishAndSendMetric:metricName];
}

@end
