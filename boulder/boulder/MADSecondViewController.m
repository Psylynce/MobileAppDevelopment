//
//  MADSecondViewController.m
//  boulder
//
//  Created by Justin Powell on 10/15/13.
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

- (IBAction)submitForm:(UIButton *)sender {
    NSString *receiver = @"mailto:justin2010powell@gmail.com?subject=Question From Boulder App";
    NSString *body = [NSString stringWithFormat:@"&body=%@ from %@ %@", _userMessage.text, _userName.text, _userEmail.text];
    NSString *email = [NSString stringWithFormat:@"%@%@", receiver, body];
    NSLog(email);
    email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    [[UIApplication sharedApplication]sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

@end
