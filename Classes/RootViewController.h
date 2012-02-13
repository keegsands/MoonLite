//
//  RootViewController.h
//  Sunshine
//
//  Created by Keegan on 7/27/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;
@class FlipsideViewController;

@interface RootViewController : UIViewController {

	IBOutlet UIButton *infoButton;
	MainViewController *mainViewController;
	FlipsideViewController *flipsideViewController;
	UINavigationBar *flipsideNavigationBar;

}

@property (nonatomic, retain) UIButton *infoButton;
@property (nonatomic, retain) MainViewController *mainViewController;
@property (nonatomic, retain) UINavigationBar *flipsideNavigationBar;
@property (nonatomic, retain) FlipsideViewController *flipsideViewController;


- (IBAction)toggleView;


@end
