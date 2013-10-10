//
//  Scene2ViewController.h
//  lab9
//
//  Created by Justin Powell on 10/10/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MADViewController.h"
#import "Favorite.h"

@interface Scene2ViewController : UIViewController
<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userMovie;
@property (weak, nonatomic) IBOutlet UITextField *userActor;
@property (strong, nonatomic)Favorite *userInfo;
@end

