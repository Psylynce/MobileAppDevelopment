//
//  MADCountryViewController.m
//  countries
//
//  Created by Justin Powell on 10/29/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import "MADCountryViewController.h"

@interface MADCountryViewController ()

@end

@implementation MADCountryViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"doneSegue"]){
        if(_countryTextfield.text.length > 0){
            _addedCountry = _countryTextfield.text;
        }
    }
}

@end
