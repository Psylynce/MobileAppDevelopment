//
//  MADViewController.h
//  lab3
//
//  Created by Justin Richard Powell on 9/10/13.
//  Copyright (c) 2013 Justin Richard Powell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
- (IBAction)buttonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *nflImage;
@property (weak, nonatomic) IBOutlet UILabel *message;
@property (weak, nonatomic) IBOutlet UITextField *userName;
- (IBAction)textFieldDone:(UITextField *)sender;

@end
