//
//  MADSecondViewController.h
//  lab10
//
//  Created by Justin Powell on 10/17/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADSecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextView *questionTextField;

- (IBAction)submitQuestion:(UIButton *)sender;

@end
