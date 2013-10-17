//
//  MADSecondViewController.m
//  lab10
//
//  Created by Justin Powell on 10/17/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import "MADSecondViewController.h"

@interface MADSecondViewController ()

@end

@implementation MADSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitQuestion:(UIButton *)sender {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    NSString *recipients = @"mailto:justin.powell@colorado.edu?subject=Question from Boulder App";
    NSString *body = [NSString stringWithFormat:@"&body=%@ from %@ %@", _questionTextField.text, _nameTextField.text,
                      _emailTextField.text];
    NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
//    NSLog(email);
    email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //returns a legal URL string
    //opens the mail app 
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}
@end
