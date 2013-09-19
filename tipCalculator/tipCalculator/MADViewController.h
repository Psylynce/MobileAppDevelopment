//
//  MADViewController.h
//  tipCalculator
//
//  Created by Justin Richard Powell on 9/19/13.
//  Copyright (c) 2013 Justin Richard Powell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
<UITextFieldDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *billAmount;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentage;
@property (weak, nonatomic) IBOutlet UITextField *numOfPeople;
@property (weak, nonatomic) IBOutlet UILabel *tipAmount;
@property (weak, nonatomic) IBOutlet UILabel *totalAmount;
@property (weak, nonatomic) IBOutlet UILabel *amountPerPerson;

@end
