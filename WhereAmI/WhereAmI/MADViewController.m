//
//  MADViewController.m
//  WhereAmI
//
//  Created by Justin Powell on 11/7/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import "MADViewController.h"
#import "MADPlace.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.locationManager = [[CLLocationManager alloc]init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [_locationManager startUpdatingLocation];
    _mapView.showsUserLocation = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 
#pragma mark CLLocationManagerDelegate Methods
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *newLocation = [locations lastObject];
    NSString *latitudeString = [NSString stringWithFormat:@"%g\u00B0",newLocation.coordinate.latitude];
    _latitudeLabel.text = latitudeString;
    NSString *longitudeString = [NSString stringWithFormat:@"%g\u00B0", newLocation.coordinate.longitude];
    _longitudeLabel.text = longitudeString;
    NSString *horizontalAccuracyString = [NSString stringWithFormat:@"%gm", newLocation.horizontalAccuracy];
    _horizontalAccuracyLabel.text = horizontalAccuracyString;
    NSString *altitude = [NSString stringWithFormat:@"%gm", newLocation.altitude];
    _altitudeLabel.text = altitude;
    NSString *verticalAccuracyString = [NSString stringWithFormat:@"%gm", newLocation.verticalAccuracy];
    _verticalAccuracyLabel.text = verticalAccuracyString;
    
    // check for an invalid accuracy
    if(newLocation.verticalAccuracy < 0 || newLocation.horizontalAccuracy < 0){
        return;
    }
    
    if(newLocation.verticalAccuracy > 50 || newLocation.horizontalAccuracy > 100){
        return;
    }
    
    if (_startPoint == nil) {
        self.startPoint = newLocation;
        self.distanceFromStart = 0;
        MADPlace *start = [[MADPlace alloc]init];
        start.coordinate = newLocation.coordinate;
        start.title = @"Start Location";
        start.subTitle = @"This is where we started";
        [_mapView addAnnotation:start];
        MKCoordinateRegion region;
        region = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 100, 100);
        [_mapView setRegion:region animated:YES];
    }else{
        self.distanceFromStart = [newLocation distanceFromLocation:_startPoint];
    }
    
    NSString *distanceFromStart = [NSString stringWithFormat:@"%gm", _distanceFromStart];
    _distanceTraveledLabel.text = distanceFromStart;
    
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSString *errorType = (error.code == kCLErrorDenied) ? @"Access Denied" : @"Unknown Error";
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error Getting Location" message:errorType delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    [alert show];
}

@end
