//
//  MADViewController.h
//  lab9
//
//  Created by Justin Powell on 10/10/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Favorite.h"

@interface MADViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *movieLabel;
@property (weak, nonatomic) IBOutlet UILabel *actorLabel;
@property (strong, nonatomic)Favorite *user;
@end
