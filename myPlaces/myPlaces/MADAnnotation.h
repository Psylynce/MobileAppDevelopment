//
//  MADAnnotation.h
//  myPlaces
//
//  Created by Justin Powell on 11/10/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MADAnnotation : NSObject <MKAnnotation>{
    NSString *titleText;
}
@property (nonatomic, copy) NSString *titleText;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;
-(id)initWithTitle: (NSString *)title;


@end
