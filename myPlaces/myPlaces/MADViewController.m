//
//  MADViewController.m
//  myPlaces
//
//  Created by Justin Powell on 11/10/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import "MADViewController.h"
#import "MADAnnotation.h"
#import "MADTableViewController.h"
#import "MADAboutViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _searchBar.delegate = self;
    UILongPressGestureRecognizer *lpg = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPress:)];
    lpg.minimumPressDuration = 1.0; // user press for 2.0 seconds
    [self.mapView addGestureRecognizer:lpg];
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    _myPlaces = arr;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    [geocoder geocodeAddressString:searchBar.text completionHandler:^(NSArray *placemarks, NSError *error){
        CLPlacemark *placemark = [placemarks objectAtIndex:0];
        MKCoordinateRegion region;
        region.center.latitude = placemark.region.center.latitude;
        region.center.longitude = placemark.region.center.longitude;
        MKCoordinateSpan span;
        double radius = placemark.region.radius / 1000;
        NSLog(@"[searchBarSearchButtonClicked] Radius is %f", radius);
        NSLog(@"Search Bar text: %@", searchBar.text);
        span.latitudeDelta = radius /100.0;
        region.span = span;
        [_mapView setRegion:region animated:YES];
    }];
}

-(void)handleLongPress:(UILongPressGestureRecognizer *)gesture{
    if (gesture.state != UIGestureRecognizerStateBegan) {
        return;
    }
    if (_searchBar.text.length < 1) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"You can't mark a place you didn't search for" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [alert show];
    }else{
        CGPoint touchPoint = [gesture locationInView:self.mapView];
        CLLocationCoordinate2D coordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
        MADAnnotation *annotation = [[MADAnnotation alloc]initWithTitle:_searchBar.text];
        annotation.coordinate = coordinate;
        if(![_myPlaces containsObject:annotation.title]){
            [self.mapView addAnnotation:annotation];
            [_myPlaces addObject:annotation.title];
            NSLog(@"My Places Array : %@", _myPlaces);
        }
        else{
            UIAlertView *alertForPlace = [[UIAlertView alloc]initWithTitle:@"Error" message:@"You have already marked this location as a place you've visited. Please search for another city" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
            [alertForPlace show];
        }
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"PlacesIdentifier"]) {
        MADTableViewController *destination = segue.destinationViewController;
        destination.title = @"My Places";
        destination.placesList = _myPlaces;
    }
}

-(void)unwindToMapFromAbout:(UIStoryboardSegue *)sender{
    
}

-(void)unwindToMapFromPlaces:(UIStoryboardSegue *)sender{
    
}

@end
