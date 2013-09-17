//
//  MADViewController.h
//  lab4
//
//  Created by Justin Richard Powell on 9/17/13.
//  Copyright (c) 2013 Justin Richard Powell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *beatlesImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *imageControl;
- (IBAction)changeImage:(UISegmentedControl *)sender;
@property (weak, nonatomic) IBOutlet UISwitch *capitalizeSwitch;
- (IBAction)changeSwitch:(UISwitch *)sender;
@property (weak, nonatomic) IBOutlet UILabel *fontSizeLabel;
- (IBAction)changeFontSize:(UISlider *)sender;

@end
