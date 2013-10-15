//
//  Scene2ViewController.m
//  lab9
//
//  Created by Justin Powell on 10/10/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import "Scene2ViewController.h"
#import "MADViewController.h"
#import "Favorite.h"

@interface Scene2ViewController ()

@end

@implementation Scene2ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _userInfo = [[Favorite alloc]init];
    _userMovie.delegate = self;
    _userActor.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"doneFavs"]){
        _userInfo.favMovie = _userMovie.text;
        _userInfo.favActor = _userActor.text;
        MADViewController *view = [segue destinationViewController];
        view.user.favMovie = _userInfo.favMovie;
        view.user.favActor = _userInfo.favActor;
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
