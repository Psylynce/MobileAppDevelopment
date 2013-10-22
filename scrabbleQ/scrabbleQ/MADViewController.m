//
//  MADViewController.m
//  scrabbleQ
//
//  Created by Justin Powell on 10/22/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController
{
    NSDictionary *words;
    NSArray *letters;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"qwordswithoutu2" ofType:@"plist"];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    words = dictionary;
    NSArray *array = [[words allKeys] sortedArrayUsingSelector:@selector(compare:)];
    letters = array;
    self.title = @"Words";
}

// Required methods for the UITableViewDataSource
// Number of rows in the table
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *letter = [letters objectAtIndex:section];
    NSArray *letterSection = [words objectForKey:letter];
    return [letterSection count];
}

// Display the data
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger section = [indexPath section];
    NSString *letter = [letters objectAtIndex:section];
    NSArray *wordsSection = [words objectForKey:letter];
    static NSString *cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [wordsSection objectAtIndex:indexPath.row];
    return cell;
}

// UITableViewDelegate method called when row is selected
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger section = [indexPath section];
    NSString *letter = [letters objectAtIndex:section];
    NSArray *wordsSection = [words objectForKey:letter];
    NSString *rowValue = [wordsSection objectAtIndex:indexPath.row];
    NSString *message = [[NSString alloc] initWithFormat:@"You selected %@", rowValue];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Row Selected" message:message delegate:nil cancelButtonTitle:@"Yes, I did" otherButtonTitles:nil];
    [alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//UITableViewDataSource method
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return [letters count];
}

// Set header for each section
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *letter = [letters objectAtIndex:section];
    return letter;
}

// Add section index
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return letters;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
