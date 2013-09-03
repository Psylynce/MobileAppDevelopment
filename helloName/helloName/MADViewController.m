//
//  MADViewController.m
//  helloName
//
//  Created by Justin Richard Powell on 9/3/13.
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

- (IBAction)textFieldDone:(UITextField *)sender {
    [sender resignFirstResponder];
    NSString *message = [[NSString alloc] initWithFormat:@"Hello, %@", _nameField.text];
    _messageField.text = message;
}
@end
