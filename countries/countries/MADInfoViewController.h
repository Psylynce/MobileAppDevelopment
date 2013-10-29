//
//  MADInfoViewController.h
//  countries
//
//  Created by Justin Powell on 10/29/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADInfoViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UILabel *continentName;
@property (weak, nonatomic) IBOutlet UILabel *countryNumber;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *number;
@end
