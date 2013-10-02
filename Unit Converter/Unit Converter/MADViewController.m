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
    _userNumber.delegate = self;
    UIInterfaceOrientation current = [UIApplication sharedApplication].statusBarOrientation;
    [self doLayout:current];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

// This code section was found on stack overflow. The iPad doesn't support the decimal pad and I didn't have enough time to implement one. This code basically limits the user to only use the numbers and decimal point characters on the keyboard.
// Link: http://stackoverflow.com/questions/6350484/uitextfield-uikeyboardtypedecimalpad-on-ipad
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *candidate = [[textField text] stringByReplacingCharactersInRange:range withString:string];
    
    // Ensure that the local decimal seperator is used max 1 time
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSString *decimalSymbol = [formatter decimalSeparator];
    if ([candidate componentsSeparatedByString:decimalSymbol].count > 2) return NO;
    
    // Ensure that all the characters used are number characters or decimal seperator
    NSString *validChars = [NSString stringWithFormat:@"0123456789%@", decimalSymbol];
    if ([candidate stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:validChars]].length) return NO;
    
    return YES;
}

// ------------------------------------------------------------------------------------------------------------------------

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    [self doLayout:toInterfaceOrientation];
}

-(void)doLayout:(UIInterfaceOrientation)orientation{
    if(UIInterfaceOrientationIsPortrait(orientation)){
        _unitChoiceButton.frame = CGRectMake(85, 75, 600, 50);
        _convertNumButton.frame = CGRectMake(85, 225, 600, 50);
        _userNumber.frame = CGRectMake(85, 150, 250, 50);
        _convertFrom.frame = CGRectMake(360, 150, 125, 50);
        _to.frame = CGRectMake(495, 150, 50, 50);
        _convertTo.frame = CGRectMake(560, 150, 125, 50);
        _convertedNum.frame = CGRectMake(85, 300, 600, 50);
        _background1.frame = CGRectMake(0, 375, 900, 900);
    }
    else{
        _unitChoiceButton.frame = CGRectMake(65, 75, 900, 50);
        _convertNumButton.frame = CGRectMake(65, 225, 900, 50);
        _userNumber.frame = CGRectMake(65, 150, 350, 50);
        _convertFrom.frame = CGRectMake(450, 150, 200, 50);
        _to.frame = CGRectMake(680, 150, 50, 50);
        _convertTo.frame = CGRectMake(760, 150, 200, 50);
        _convertedNum.frame = CGRectMake(85, 300, 900, 50);        
        _background1.frame = CGRectMake(0, 375, 1500, 900);
    }
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
                   @"cubic m": @1000,
                   @"l": @1,
                   @"ml": @0.001,
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
        if(buttonIndex == 0){
            [_unitChoiceButton setTitle:[actionSheet buttonTitleAtIndex:buttonIndex] forState:UIControlStateNormal];
            [_convertFrom setTitle:@"mm" forState:UIControlStateNormal];
            [_convertTo setTitle:@"mm" forState:UIControlStateNormal];
        }
        else if (buttonIndex == 1) {
            [_unitChoiceButton setTitle:[actionSheet buttonTitleAtIndex:buttonIndex] forState:UIControlStateNormal];
            [_convertFrom setTitle:@"mg" forState:UIControlStateNormal];
            [_convertTo setTitle:@"mg" forState:UIControlStateNormal];
        }
        else if (buttonIndex == 2){
            [_unitChoiceButton setTitle:[actionSheet buttonTitleAtIndex:buttonIndex] forState:UIControlStateNormal];
            [_convertFrom setTitle:@"l" forState:UIControlStateNormal];
            [_convertTo setTitle:@"l" forState:UIControlStateNormal];
        }
        else{
            [_unitChoiceButton setTitle:@"Choose Units" forState:UIControlStateNormal];
        }
    }
    else if (actionSheet.tag == 1){
        if (buttonIndex == 0 || buttonIndex == 1 || buttonIndex == 2 || buttonIndex == 3) {
                [_convertFrom setTitle:[actionSheet buttonTitleAtIndex:buttonIndex] forState: UIControlStateNormal];
        }else{
            [_convertFrom setTitle:_convertFrom.currentTitle forState:UIControlStateNormal];
        }

    }
    else if (actionSheet.tag == 2){
        if (buttonIndex == 0 || buttonIndex == 1 || buttonIndex == 2 || buttonIndex == 3) {
            [_convertTo setTitle:[actionSheet buttonTitleAtIndex:buttonIndex] forState: UIControlStateNormal];
        }else{
            [_convertTo setTitle:_convertTo.currentTitle forState:UIControlStateNormal];
        }
    }
 
    
}

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
        [convertUnits addButtonWithTitle:@"ml"];
        [convertUnits addButtonWithTitle:@"l"];
        [convertUnits addButtonWithTitle:@"cubic m"];
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
        [convertUnits addButtonWithTitle:@"ml"];
        [convertUnits addButtonWithTitle:@"l"];
        [convertUnits addButtonWithTitle:@"cubic m"];
        [convertUnits showInView:self.view];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning" message:@"You must choose a unit type first!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
}


- (IBAction)convert:(UIButton *)sender {
    if (![_userNumber.text floatValue]) {
        _convertedNum.text = @"You can't convert words silly.";
    }
    else if ([_unitChoiceButton.currentTitle isEqualToString:@"Choose Units"]) {
        _convertedNum.text = @"You need to choose some type of unit to convert.";
    }
    else{
        float num = [_userNumber.text floatValue];
        float conversionFromNum = [[values objectForKey:_convertFrom.currentTitle] floatValue ];
        float newNum = num * conversionFromNum;
        float final =  newNum / [[values objectForKey:_convertTo.currentTitle] floatValue];
        _convertedNum.text = [NSMutableString stringWithFormat:@"%.4f %@ = %.4f %@", num, _convertFrom.currentTitle, final, _convertTo.currentTitle];
    }
}

@end
