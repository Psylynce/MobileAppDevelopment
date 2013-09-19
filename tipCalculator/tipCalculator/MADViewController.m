//
//  MADViewController.m
//  tipCalculator
//
//  Created by Justin Richard Powell on 9/19/13.
//  Copyright (c) 2013 Justin Richard Powell. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _billAmount.delegate=self;
    _tipPercentage.delegate=self;
    _numOfPeople.delegate=self;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateTipTotals{
    float billAmount = [_billAmount.text floatValue];
    float pct = [_tipPercentage.text floatValue];
    int numOfPeople = [_numOfPeople.text intValue];
    
    pct = pct/100;
    float tip = pct*billAmount;
    float total = tip+billAmount;
    float personTotal = 0;
    if(numOfPeople > 0){
        personTotal = total/numOfPeople;
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Warning" message:@"You can't have less than one person paying the bill" delegate:self cancelButtonTitle: @"Cancel" otherButtonTitles:@"Sorry", nil];
        [alert show];
    }
    NSNumberFormatter *currency = [[NSNumberFormatter alloc]init];
    [currency setNumberStyle:NSNumberFormatterCurrencyStyle];
    _tipAmount.text = [currency stringFromNumber:[NSNumber numberWithFloat:tip]];
    _totalAmount.text = [currency stringFromNumber:[NSNumber numberWithFloat:total]];
    _amountPerPerson.text = [currency stringFromNumber:[NSNumber numberWithFloat:personTotal]];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    [self updateTipTotals];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        _numOfPeople.text = [NSString stringWithFormat:@"1"];
        [self updateTipTotals];
    }
}

@end
