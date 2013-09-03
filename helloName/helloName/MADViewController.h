//
//  MADViewController.h
//  helloName
//
//  Created by Justin Richard Powell on 9/3/13.
//  Copyright (c) 2013 Justin Richard Powell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UILabel *messageField;

- (IBAction)textFieldDone:(UITextField *)sender;

@end
