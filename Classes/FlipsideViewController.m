//
//  FlipsideViewController.m
//  Sunshine
//
//  Created by Keegan on 7/27/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "FlipsideViewController.h"


@implementation FlipsideViewController
@synthesize datePicker;
@synthesize sunshineSwitch;

- (void)viewDidLoad {
	self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];
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
	[super dealloc];
}

- (IBAction) switchSunshine{
    
    /* Testing the use of IBAction*/
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Sunshine Switched" message:@"You have switched the sunshine switch state" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil];
    
    [alert show];
    [alert release];
}


@end
