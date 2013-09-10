//
//  MADViewController.m
//  lab3
//
//  Created by Justin Richard Powell on 9/10/13.
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    if(sender.tag == 1){
        _nflImage.image = [UIImage imageNamed:@"380px-Madden_NFL_09_Broncos_Logo_Large.png"];
        _message.text = [NSString stringWithFormat: @"Aww shucks, that is my favorite team too, %@", _userName.text];
    }
    if(sender.tag == 2){
        _nflImage.image = [UIImage imageNamed:@"SeattleSeahawksLogo.png"];
        _message.text = [NSString stringWithFormat: @"The Seahawks are a pretty good team %@", _userName.text];
    }
}
- (IBAction)textFieldDone:(UITextField *)sender {
    [sender resignFirstResponder];
}
@end
