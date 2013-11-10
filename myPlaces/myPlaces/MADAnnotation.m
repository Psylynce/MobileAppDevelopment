//
//  MADAnnotation.m
//  myPlaces
//
//  Created by Justin Powell on 11/10/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import "MADAnnotation.h"

@implementation MADAnnotation
@synthesize titleText;

-(NSString *)title{
    return titleText;
}

-(void)setTitle: (NSString*)title{
    titleText = title;
}

-(id)initWithTitle:(NSString *)title{
    if ((self = [super init])) {
        titleText = [title copy];
    }
    return self;
}

-(void)setCoordinate:(CLLocationCoordinate2D)newCoordinate{
    _coordinate = newCoordinate;
}

@end
