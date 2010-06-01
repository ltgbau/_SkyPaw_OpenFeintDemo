//
//  _SkyPaw_OpenFeintDemoAppDelegate.h
//  _SkyPaw_OpenFeintDemo
//
//  Created by Bau Bi on 31/05/10.
//  Copyright SkyPaw Co.,Ltd 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class _SkyPaw_OpenFeintDemoViewController;

@interface _SkyPaw_OpenFeintDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    _SkyPaw_OpenFeintDemoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet _SkyPaw_OpenFeintDemoViewController *viewController;

@end

