//
//  MADViewController.m
//  music
//
//  Created by Justin Powell on 10/3/13.
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
    _genre = [[NSArray alloc]initWithObjects:@"Country", @"Pop", @"Rock", @"Alternative", @"Hip Hop", @"Jazz", @"Classical", nil];
    _decade = [[NSArray alloc]initWithObjects:@"1950s", @"1960s", @"1970s", @"1980s", @"1990s", @"2000s", @"2010s", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Change the number of components in the Picker
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

// returns the number of rows in the component
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component == 0)
        return [_genre count];
    else
        return [_decade count];
}

// Picker Delegate Method
// returns the title for a given row
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component == 0)
        return [_genre objectAtIndex:row];
    else
        return [_decade objectAtIndex:row];
}

// Called when row is selected
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSInteger genreRow = [_musicPicker selectedRowInComponent:0];
    NSInteger decadeRow = [_musicPicker selectedRowInComponent:1];
    _choiceLabel.text = [NSString stringWithFormat:@"You like %@ from the %@", [_genre objectAtIndex:genreRow], [_decade objectAtIndex:decadeRow]];
}

@end
