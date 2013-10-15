//
//  MADSecondViewController.h
//  boulder
//
//  Created by Justin Powell on 10/15/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADSecondViewController : UIViewController
<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *userEmail;
@property (weak, nonatomic) IBOutlet UITextView *userMessage;
- (IBAction)submitForm:(UIButton *)sender;

@end
