//
//  MADViewController.h
//  Unit Converter
//
//  Created by Justin Powell on 9/27/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
<UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIButton *unitChoiceButton;
- (IBAction)chooseUnits:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *convertFrom;
- (IBAction)convertFromPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *convertTo;
- (IBAction)convertToPressed:(UIButton *)sender;

//NSDictionary *values = @{@"m": @1.0};

@property (weak, nonatomic) IBOutlet UITextField *userNumber;
- (IBAction)convert:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *convertedNum;

@end
