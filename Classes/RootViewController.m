//
//  RootViewController.m
//  Sunshine
//
//  Created by Keegan on 7/27/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "RootViewController.h"
#import "MainViewController.h"
#import "FlipsideViewController.h"


@implementation RootViewController

@synthesize infoButton;
@synthesize flipsideNavigationBar;
@synthesize mainViewController;
@synthesize flipsideViewController;


// If the view controller loaded do some setup work.
- (void)viewDidLoad {
    // Create a rectangle to go around the info button
	CGRect newInfoButtonRect = CGRectMake(infoButton.frame.origin.x-25, 
										  infoButton.frame.origin.y-25, infoButton.frame.size.width+50, 
										  infoButton.frame.size.height+50);
	// Set the frame for the button
    [infoButton setFrame:newInfoButtonRect];
	
    // Create the controller for the MainView
	MainViewController *viewController = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
	self.mainViewController = viewController;
    // Set the sunshineTime
	viewController.sunshineTime;
    // Set the startup time
	viewController.startupTime = [NSDate date];
	[viewController release];
	
    // Add the main view and info button to the Root View
	[self.view insertSubview:mainViewController.view belowSubview:infoButton];
	
	
}


- (void)loadFlipsideViewController {
	
    // Create the controller for the flip side
	FlipsideViewController *viewController = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	self.flipsideViewController = viewController;
	[viewController release];
	
	// Set up the navigation bar
	UINavigationBar *aNavigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 44.0)];
	aNavigationBar.barStyle = UIBarStyleBlackOpaque;
	self.flipsideNavigationBar = aNavigationBar;
	[aNavigationBar release];
	
	UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(toggleView)];
	UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@"MoonLite v1.1"];
	navigationItem.rightBarButtonItem = buttonItem;
	[flipsideNavigationBar pushNavigationItem:navigationItem animated:NO];
	[navigationItem release];
	[buttonItem release];
}


- (IBAction)toggleView {	
	/*
	 This method is called when the info or Done button is pressed.
	 It flips the displayed view from the main view to the flipside view and vice-versa.
	 */
	if (flipsideViewController == nil) {
		[self loadFlipsideViewController];
	}
	// Get the main view and the flipside view.
	UIView *mainView = mainViewController.view;
	UIView *flipsideView = flipsideViewController.view;
	
    // Start the animation to flip the view
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1];
	[UIView setAnimationTransition:([mainView superview] ? UIViewAnimationTransitionFlipFromRight : UIViewAnimationTransitionFlipFromLeft) forView:self.view cache:YES];
	
    
	if ([mainView superview] != nil) {
        // Switching to the Flipside controller
		[flipsideViewController viewWillAppear:YES];
		[mainViewController viewWillDisappear:YES];
		[mainView removeFromSuperview];
        [infoButton removeFromSuperview];
		[self.view addSubview:flipsideView];
		[self.view insertSubview:flipsideNavigationBar aboveSubview:flipsideView];
		[mainViewController viewDidDisappear:YES];
		[flipsideViewController viewDidAppear:YES];
		if(mainViewController.sunshineTime != nil)
		{
			[flipsideViewController.datePicker setDate:mainViewController.sunshineTime animated:YES];
		}
		


	} else {
        // Switching to the Main view
		mainViewController.sunshineTime = flipsideViewController.datePicker.date;
        // Start the timer if the sunshine switch is on
		if(flipsideViewController.sunshineSwitch.on)
		{
			[mainViewController startTimer];
		}
		else
		{
			[mainViewController stopTimer];
		}
        // Set up animations
		[mainViewController viewWillAppear:YES];
		[flipsideViewController viewWillDisappear:YES];
        // Remove flip side components
		[flipsideView removeFromSuperview];
		[flipsideNavigationBar removeFromSuperview];
        // Add MainView stuff
		[self.view addSubview:mainView];
		[self.view insertSubview:infoButton aboveSubview:mainViewController.view];
		[flipsideViewController viewDidDisappear:YES];
		[mainViewController viewDidAppear:YES];
	}
    // Commit the animations
	[UIView commitAnimations];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[infoButton release];
	[flipsideNavigationBar release];
	[mainViewController release];
	[flipsideViewController release];
	[super dealloc];
}


@end
