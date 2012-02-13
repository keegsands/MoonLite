//
//  SunshineAppDelegate.m
//  Sunshine
//
//  Created by Keegan on 7/27/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "MoonLiteAppDelegate.h"
#import "RootViewController.h"

@implementation MoonLiteAppDelegate


@synthesize window;
@synthesize rootViewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Shut off the idle screen saver so app
    // will always stay open.
	application.idleTimerDisabled = YES;
    // Add the view from the RootViewController to the current window
	[window addSubview:rootViewController.view];
    // Make the window visible
	[window makeKeyAndVisible];
	return NO;
}


- (void)dealloc {
	[rootViewController release];
	[window release];
	[super dealloc];
}

@end
