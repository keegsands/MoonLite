//
//  FlipsideViewController.h
//  Sunshine
//
//  Created by Keegan on 7/27/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlipsideViewController : UIViewController {
	
	IBOutlet UIDatePicker *datePicker;
	IBOutlet UISwitch *sunshineSwitch;

}
@property (nonatomic, retain) UIDatePicker *datePicker;
@property (nonatomic, retain) UISwitch *sunshineSwitch;
- (IBAction)switchSunshine;
@end
