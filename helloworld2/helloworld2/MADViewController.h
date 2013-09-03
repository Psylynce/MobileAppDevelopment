//
//  MADViewController.h
//  helloworld2
//
//  Created by Justin Richard Powell on 9/3/13.
//  Copyright (c) 2013 Justin Richard Powell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController


- (IBAction)buttonPressed:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *messageText;


@end
