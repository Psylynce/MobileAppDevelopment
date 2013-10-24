//
//  MADDetailViewController.h
//  countries
//
//  Created by Justin Powell on 10/24/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADDetailViewController : UITableViewController
<UITableViewDelegate, UITableViewDataSource>
@property(strong, nonatomic)NSMutableArray *countryList;
@end
