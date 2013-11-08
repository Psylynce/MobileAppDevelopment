//
//  MADPlace.h
//  WhereAmI
//
//  Created by Justin Powell on 11/7/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MADPlace : NSObject <MKAnnotation>
@property(copy, nonatomic) NSString *title;
@property(copy, nonatomic) NSString *subTitle;
@property(assign, nonatomic) CLLocationCoordinate2D coordinate;

@end
