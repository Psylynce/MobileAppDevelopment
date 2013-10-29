//
//  MADCountryViewController.h
//  countries
//
//  Created by Justin Powell on 10/29/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MADDetailViewController.h"

@interface MADCountryViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *countryTextfield;
@property (copy, nonatomic) NSString *addedCountry;
@end
