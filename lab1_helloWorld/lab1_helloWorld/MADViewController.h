//
//  MADViewController.h
//  lab1_helloWorld
//
//  Created by Justin Richard Powell on 9/10/13.
//  Copyright (c) 2013 Justin Richard Powell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
- (IBAction)buttonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *message;

@end
