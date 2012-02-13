//
//  MainViewController.m
//  Sunshine
//
//  Created by Keegan on 7/27/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"

@implementation MainViewController

@synthesize sunImage;
@synthesize testLabel;
@synthesize sunshineTime;
@synthesize startupTime;
@synthesize sunshineTimer;



- (void)updateImage:(NSTimer *)theTimer {
	if(self.sunshineTime != nil)
	{
		if([self getCombinedTime])
		{
			UIImage *img = [UIImage imageNamed:@"sun.jpg"];
			if (img != nil) {
				[self.sunImage setImage:img];
			}
			[self stopTimer];
		}
		
	}
}

- (BOOL)getCombinedTime{
	NSDate *currentTime = [NSDate date];
	NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
	[dateFormatter setDateFormat:@"HH"];
	int sunshineHour = [[dateFormatter stringFromDate:sunshineTime] intValue];
	int startupHour = [[dateFormatter stringFromDate:startupTime] intValue];
	int currentHour = [[dateFormatter stringFromDate:currentTime] intValue];
	[dateFormatter setDateFormat:@"mm"];
	int sunshineMinute = [[dateFormatter stringFromDate:sunshineTime] intValue];
	int startupMinute = [[dateFormatter stringFromDate:startupTime] intValue];
	int currentMinute = [[dateFormatter stringFromDate:currentTime] intValue];
	/*[currentTime dealloc];*/
	
	int minutesToRun;

	if(sunshineHour >= startupHour)
	{
		minutesToRun = (sunshineHour - startupHour) * 60;
	}
	else
	{
		minutesToRun = (24 - startupHour + sunshineHour) * 60;	
	}

	if(sunshineMinute >= startupMinute)
	{
		minutesToRun+= sunshineMinute - startupMinute;
	}
	else
	{
		minutesToRun+= 60 - startupMinute + sunshineMinute;
	}
	
	int minutesRun;
	if(currentHour >= startupHour)
	{
		minutesRun = (currentHour - startupHour) * 60;
	}
	else
	{
		minutesRun = (24 - startupHour + currentHour) * 60;	
	}
	
	if(currentMinute >= startupMinute)
	{
		minutesRun+= currentMinute - startupMinute;
	}
	else
	{
		minutesRun+= 60 - startupMinute + currentMinute;
	}
	
		
	//return [NSString stringWithFormat:@"%d%@%d%@%d%d", minutesRun, @" total minutes run ", minutesToRun, @" total minutes to run ", sunshineHour, sunshineMinute];
	return minutesRun >= minutesToRun;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {

	}
	return self;
}

- (void)startTimer {
	if(self.sunshineTimer != nil)
	{
		[self stopTimer];
	}
	self.sunshineTimer = [NSTimer scheduledTimerWithTimeInterval:60.0f
														  target:self
														selector:@selector(updateImage:)
														userInfo:nil
														 repeats:YES];
}

- (void)stopTimer {
	if(self.sunshineTimer != nil)
	{
		[self.sunshineTimer invalidate];
	}
}


/*
 If you need to do additional setup after loading the view, override viewDidLoad */
 - (void)viewDidLoad {
	 
	 [super viewDidLoad];
	 self.testLabel.text = [sunshineTime description];
	 
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


@end
