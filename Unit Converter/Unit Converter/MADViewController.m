//
//  MADViewController.m
//  Unit Converter
//
//  Created by Justin Powell on 9/27/13.
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

NSDictionary *values = nil;
+(void)initialize{
    if(!values){
        values = @{
                   @"mm": @0.001,
                   @"cm": @0.01,
                   @"m": @1.0,
                   @"km": @1000,
                   @"mg": @0.001,
                   @"g": @1,
                   @"kg": @1000,
                   @"mt": @1000000,
                   @"cups": @1.0,
                   @"pints": @4.0,
                   @"quarts": @8.0,
                   @"gallons": @16.0
                   };
    }
}

- (IBAction)chooseUnits:(UIButton *)sender {
    UIActionSheet *units = [[UIActionSheet alloc]initWithTitle:@"Units" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Distance", @"Weight", @"Volume", nil];
    [units setTag:0];
    [units showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (actionSheet.tag == 0) {
        if(buttonIndex == 0 || buttonIndex== 1 || buttonIndex == 2){
            [_unitChoiceButton setTitle:[actionSheet buttonTitleAtIndex:buttonIndex] forState:UIControlStateNormal];
        }
        else{
            [_unitChoiceButton setTitle:@"Choose Units" forState:UIControlStateNormal];
        }
    }
    else if (actionSheet.tag == 1){
        if (buttonIndex == 0 || buttonIndex == 1 || buttonIndex == 2 || buttonIndex == 3) {
                [_convertFrom setTitle:[actionSheet buttonTitleAtIndex:buttonIndex] forState: UIControlStateNormal];
        }else{
            [_convertFrom setTitle:@"Choose" forState:UIControlStateNormal];
        }

    }
    else if (actionSheet.tag == 2){
        if (buttonIndex == 0 || buttonIndex == 1 || buttonIndex == 2 || buttonIndex == 3) {
            [_convertTo setTitle:[actionSheet buttonTitleAtIndex:buttonIndex] forState: UIControlStateNormal];
        }else{
            [_convertTo setTitle:@"Choose" forState:UIControlStateNormal];
        }
    }
 
    
}

//-(void)createActionSheets{
//    UIActionSheet *convertUnits = [[UIActionSheet alloc]initWithTitle:_unitChoiceButton.currentTitle delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
//    [convertUnits setTag:1];
//    if ([_unitChoiceButton.currentTitle isEqualToString:@"Distance"]) {
//        [convertUnits addButtonWithTitle:@"mm"];
//        [convertUnits addButtonWithTitle:@"cm"];
//        [convertUnits addButtonWithTitle:@"m"];
//        [convertUnits addButtonWithTitle:@"km"];
//        [convertUnits showInView:self.view];
//    }
//    else if ([_unitChoiceButton.currentTitle isEqualToString:@"Weight"]){
//        [convertUnits addButtonWithTitle:@"mg"];
//        [convertUnits addButtonWithTitle:@"g"];
//        [convertUnits addButtonWithTitle:@"kg"];
//        [convertUnits addButtonWithTitle:@"lbs"];
//        [convertUnits showInView:self.view];
//    }
//    else if ([_unitChoiceButton.currentTitle isEqualToString:@"Liquid Measurements"]){
//        [convertUnits addButtonWithTitle:@"cups"];
//        [convertUnits addButtonWithTitle:@"pints"];
//        [convertUnits addButtonWithTitle:@"quarts"];
//        [convertUnits addButtonWithTitle:@"gallons"];
//        [convertUnits showInView:self.view];
//    }
//    else{
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning" message:@"You must choose a unit type first!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
//        [alert show];
//    }
//}

- (IBAction)convertFromPressed:(UIButton *)sender {
    UIActionSheet *convertUnits = [[UIActionSheet alloc]initWithTitle:_unitChoiceButton.currentTitle delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    [convertUnits setTag:1];
    if ([_unitChoiceButton.currentTitle isEqualToString:@"Distance"]) {
        [convertUnits addButtonWithTitle:@"mm"];
        [convertUnits addButtonWithTitle:@"cm"];
        [convertUnits addButtonWithTitle:@"m"];
        [convertUnits addButtonWithTitle:@"km"];
        [convertUnits showInView:self.view];
    }
    else if ([_unitChoiceButton.currentTitle isEqualToString:@"Weight"]){
        [convertUnits addButtonWithTitle:@"mg"];
        [convertUnits addButtonWithTitle:@"g"];
        [convertUnits addButtonWithTitle:@"kg"];
        [convertUnits addButtonWithTitle:@"mt"];
        [convertUnits showInView:self.view];
    }
    else if ([_unitChoiceButton.currentTitle isEqualToString:@"Volume"]){
        [convertUnits addButtonWithTitle:@"cups"];
        [convertUnits addButtonWithTitle:@"pints"];
        [convertUnits addButtonWithTitle:@"quarts"];
        [convertUnits addButtonWithTitle:@"gallons"];
        [convertUnits showInView:self.view];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning" message:@"You must choose a unit type first!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
}

- (IBAction)convertToPressed:(UIButton *)sender {
    UIActionSheet *convertUnits = [[UIActionSheet alloc]initWithTitle:_unitChoiceButton.currentTitle delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    [convertUnits setTag:2];
    if ([_unitChoiceButton.currentTitle isEqualToString:@"Distance"]) {
        [convertUnits addButtonWithTitle:@"mm"];
        [convertUnits addButtonWithTitle:@"cm"];
        [convertUnits addButtonWithTitle:@"m"];
        [convertUnits addButtonWithTitle:@"km"];
        [convertUnits showInView:self.view];
    }
    else if ([_unitChoiceButton.currentTitle isEqualToString:@"Weight"]){
        [convertUnits addButtonWithTitle:@"mg"];
        [convertUnits addButtonWithTitle:@"g"];
        [convertUnits addButtonWithTitle:@"kg"];
        [convertUnits addButtonWithTitle:@"mt"];
        [convertUnits showInView:self.view];
    }
    else if ([_unitChoiceButton.currentTitle isEqualToString:@"Volume"]){
        [convertUnits addButtonWithTitle:@"cups"];
        [convertUnits addButtonWithTitle:@"pints"];
        [convertUnits addButtonWithTitle:@"quarts"];
        [convertUnits addButtonWithTitle:@"gallons"];
        [convertUnits showInView:self.view];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning" message:@"You must choose a unit type first!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
}

-(BOOL)validUserInput{
    if (![_userNumber.text floatValue]) {
        _convertedNum.text = @"You can't convert words silly.";
        return false;
    }
    else if ([_unitChoiceButton.currentTitle isEqualToString:@"Choose Units"]) {
        _convertedNum.text = @"You need to choose some type of unit to convert.";
        return false;
    }
    else if ([_convertFrom.currentTitle isEqualToString:@"Units"] || [_convertTo.currentTitle isEqualToString:@"Units"]){
        _convertedNum.text = @"You need to choose units to convert!";
        return false;
    }
    else{
        return true;
    }
}

- (IBAction)convert:(UIButton *)sender {
//    if(validUserInput){
        float num = [_userNumber.text floatValue];
        float conversionFromNum = [[values objectForKey:_convertFrom.currentTitle] floatValue ];
        float newNum = num * conversionFromNum;
        float final =  newNum / [[values objectForKey:_convertTo.currentTitle] floatValue];
        _convertedNum.text = [NSMutableString stringWithFormat:@"%f %@ = %f %@", num, _convertFrom.currentTitle, final, _convertTo.currentTitle];
//    }
}

@end
