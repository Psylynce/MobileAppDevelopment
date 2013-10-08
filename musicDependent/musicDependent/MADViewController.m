//
//  MADViewController.m
//  musicDependent
//
//  Created by Justin Powell on 10/8/13.
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
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"artistalbums" ofType:@"plist"];
    _artistAlbums = [[NSDictionary alloc]initWithContentsOfFile:plistPath];
    _artists = [_artistAlbums allKeys];
    NSString *selectedArtist = [_artists objectAtIndex:0];
    _albums = [_artistAlbums objectForKey:selectedArtist];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == artistComponent) {
        return [_artists count];
    }
    else return [_albums count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == artistComponent) {
        return [_artists objectAtIndex:row];
    }
    else return [_albums objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == artistComponent) {
        NSString *selectedArtist = [_artists objectAtIndex:row];
        _albums = [_artistAlbums objectForKey:selectedArtist];
        
        [_musicPicker selectRow:0 inComponent:albumComponent animated:YES];
        [_musicPicker reloadComponent:albumComponent];
    }
    // Get the rows for the artist and album
    NSInteger artistRow = [_musicPicker selectedRowInComponent:artistComponent];
    NSInteger albumRow = [_musicPicker selectedRowInComponent:albumComponent];
    _musicLabel.text = [NSString stringWithFormat:@"You like %@'s %@!", [_artists objectAtIndex:artistRow], [_albums objectAtIndex:albumRow]];
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    if (component == albumComponent) {
        return 175;
    }
    else return 120;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 33;
}

@end
