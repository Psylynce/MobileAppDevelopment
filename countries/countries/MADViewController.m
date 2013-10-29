//
//  MADViewController.m
//  countries
//
//  Created by Justin Powell on 10/24/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import "MADViewController.h"
#import "MADDetailViewController.h"
#import "MADInfoViewController.h"

@interface MADViewController (){
    NSMutableDictionary *continentData;
}

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"continents" ofType:@"plist"];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    continentData = dict;
}

// Populate the table
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [continentData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSArray *rowData = [continentData allKeys];
    cell.textLabel.text = [rowData objectAtIndex:indexPath.row];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"countrySegue"]){
        MADDetailViewController *detailViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        NSArray *rowData = [continentData allKeys];
        detailViewController.title = [rowData objectAtIndex:indexPath.row];
        detailViewController.countryList = [continentData objectForKey:detailViewController.title];
    }
    if([segue.identifier isEqualToString:@"continentSegue"]){
        MADInfoViewController *infoViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSArray *rowData = [continentData allKeys];
        infoViewController.name = [rowData objectAtIndex:indexPath.row];
        infoViewController.number = [NSString stringWithFormat:@"%d", [[continentData objectForKey:infoViewController.name]count]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
