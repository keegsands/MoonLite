//
//  MainViewController.h
//  Sunshine
//
//  Created by Keegan on 7/27/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Model;
@interface MainViewController : UIViewController {
	IBOutlet UIImageView *sunImage;
	IBOutlet UILabel *testLabel;
	NSDate *sunshineTime;
	NSDate *startupTime;
	NSTimer *sunshineTimer;
}

@property (nonatomic, retain) UIImageView *sunImage;
@property (nonatomic, retain) UILabel *testLabel;
@property (nonatomic, retain) NSDate *sunshineTime;
@property (nonatomic, retain) NSDate *startupTime;
@property (nonatomic, retain) NSTimer *sunshineTimer;


- (BOOL)getCombinedTime;
- (void)startTimer;
- (void)stopTimer;

@end
