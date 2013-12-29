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
    // Override point for customization after application launch.
    NSString *apiHost = @"ec2-174-129-123-237.compute-1.amazonaws.com:9000";
    NSString *apiKey = @"93c5a127-e2a4-42cc-9cc6-cf17fdac8a7f";

    logger = [[WNGLogger alloc] initWithConfig:apiHost apiKey:apiKey];
    
    [self someIntensiveLogic];
    
    return YES;
}

- (void) someIntensiveLogic {
    NSString *metricName = @"sample-app_WNGAppDelegate_someIntensiveLogic";
    [logger recordStart:metricName];

    [NSThread sleepForTimeInterval:0.5];
    
    [logger recordFinishAndSendMetric:metricName];
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
