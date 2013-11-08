//
//  MADViewController.h
//  WhereAmI
//
//  Created by Justin Powell on 11/7/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MADViewController : UIViewController <CLLocationManagerDelegate>
@property(strong,nonatomic) CLLocationManager *locationManager;
@property(strong, nonatomic) CLLocation *startPoint;
@property(assign, nonatomic) CLLocationDistance distanceFromStart;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *horizontalAccuracyLabel;
@property (weak, nonatomic) IBOutlet UILabel *altitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *verticalAccuracyLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceTraveledLabel;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end
