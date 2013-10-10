//
//  MADViewController.m
//  lab9
//
//  Created by Justin Powell on 10/10/13.
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
    _user = [[Favorite alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)returned:(UIStoryboardSegue *)segue{
    _movieLabel.text = _user.favMovie;
    _actorLabel.text = _user.favActor;
}

-(void)viewWillAppear:(BOOL)animated{
    _movieLabel.text = _user.favMovie;
    _actorLabel.text = _user.favActor;
}

@end
