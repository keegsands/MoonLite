//
//  SunshineAppDelegate.h
//  Sunshine
//
//  Created by Keegan on 7/27/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface MoonLiteAppDelegate : NSObject <UIApplicationDelegate> {
	IBOutlet UIWindow *window;
    // Root controller for the view
	IBOutlet RootViewController *rootViewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) RootViewController *rootViewController;

@end

