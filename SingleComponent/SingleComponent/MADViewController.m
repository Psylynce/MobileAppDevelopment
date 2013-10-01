//
//  MADViewController.m
//  SingleComponent
//
//  Created by Justin Powell on 9/29/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.characterNames = @[@"Luke", @"Leia", @"Han", @"Chewie", @"R2D2", @"C3PO", @"Darth Vader"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonPressed{
    NSInteger row = [self.singlePicker selectedRowInComponent:0];
    NSString *selected = self.characterNames[row];
    NSString *title = [[NSString alloc]initWithFormat:@"You selected %@!", selected];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:@"Thank you for choosing." delegate:nil cancelButtonTitle:@"Thanks!" otherButtonTitles:nil];
    [alert show];
    [_buttonName setTitle:selected forState:UIControlStateNormal];
}

#pragma mark -
#pragma mark Picker Data Source Methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.characterNames count];
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.characterNames[row];
}

@end
