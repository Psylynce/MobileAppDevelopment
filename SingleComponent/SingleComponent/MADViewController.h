//
//  MADViewController.h
//  SingleComponent
//
//  Created by Justin Powell on 9/29/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
<UIPickerViewDelegate, UIPickerViewDataSource>
@property(strong, nonatomic)IBOutlet UIPickerView *singlePicker;
@property(strong, nonatomic) NSArray *characterNames;
@property (weak, nonatomic) IBOutlet UIButton *buttonName;
-(IBAction)buttonPressed;
@end
