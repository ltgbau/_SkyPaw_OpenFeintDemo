//
//  _SkyPaw_OpenFeintDemoAppDelegate.m
//  _SkyPaw_OpenFeintDemo
//
//  Created by Bau Bi on 31/05/10.
//  Copyright SkyPaw Co.,Ltd 2010. All rights reserved.
//

#import "_SkyPaw_OpenFeintDemoAppDelegate.h"
#import "_SkyPaw_OpenFeintDemoViewController.h"
#import "OpenFeint.h"

@implementation _SkyPaw_OpenFeintDemoAppDelegate

@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
    [OpenFeint initializeWithProductKey:@"AhnpO7Kd2ggGmSm7T54uA" andSecret:@"rNH9mDJCRB0heQ2185PUVZmdymc03Q3LbYamhUa1cM" andDisplayName:@"TestGameFull" andSettings:nil andDelegates:nil];
        
//    [OpenFeint launchDashboard];
    
	return YES;
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
