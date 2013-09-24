//
//  MADViewController.m
//  Restructure_CH5
//
//  Created by Justin Richard Powell on 9/24/13.
//  Copyright (c) 2013 Justin Richard Powell. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIInterfaceOrientation curentOrientation = [UIApplication sharedApplication].statusBarOrientation;
    [self doLayoutForOrientation:curentOrientation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    [self doLayoutForOrientation:toInterfaceOrientation];
}
-(void)doLayoutForOrientation:(UIInterfaceOrientation)orientation{
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        _bigButton.frame = CGRectMake(20, 20, 280, 280);
        _action1.frame = CGRectMake(20, 320, 120, 40);
        _action2.frame = CGRectMake(180, 320, 120, 40);
        _action3.frame = CGRectMake(20, 400, 120, 40);
        _action4.frame = CGRectMake(180, 400, 120, 40);
    }
    else{
        _bigButton.frame = CGRectMake(20, 20, 260, 260);
        _action1.frame = CGRectMake(320, 20, 120, 40);
        _action2.frame = CGRectMake(320, 160, 120, 40);
        _action3.frame = CGRectMake(320, 90, 120, 40);
        _action4.frame = CGRectMake(320, 230, 120, 40);
    }
}

@end
