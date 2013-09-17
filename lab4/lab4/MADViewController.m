//
//  MADViewController.m
//  lab4
//
//  Created by Justin Richard Powell on 9/17/13.
//  Copyright (c) 2013 Justin Richard Powell. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    _imageControl.selectedSegmentIndex = -1;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateImage{
    if (_imageControl.selectedSegmentIndex == 0) {
        _titleLabel.text = @"Young Beatles";
        _beatlesImage.image = [UIImage imageNamed:@"beatles1.png"];
    }
    else{
        _titleLabel.text = @"Experienced Beatles";
        _beatlesImage.image = [UIImage imageNamed:@"beatles2.png"];
    }
}

-(void)updateCaps{
    if (_capitalizeSwitch.on) {
        _titleLabel.text = [_titleLabel.text uppercaseString];
    }
    else{
        _titleLabel.text = [_titleLabel.text lowercaseString];
    }
}

- (IBAction)changeImage:(UISegmentedControl *)sender {
    [self updateImage];
    [self updateCaps];
}
- (IBAction)changeSwitch:(UISwitch *)sender {
    [self updateCaps];
}
- (IBAction)changeFontSize:(UISlider *)sender {
    int fontSize = sender.value;
    _fontSizeLabel.text = [NSString stringWithFormat:@"%d", fontSize];
    UIFont *newFont = [UIFont systemFontOfSize:sender.value];
    _titleLabel.font = newFont;
}


@end
