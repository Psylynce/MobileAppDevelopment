//
//  MADArchive.m
//  Tasks
//
//  Created by Justin Powell on 12/3/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import "MADArchive.h"
#define kTask1Key @"Task1"
#define kTask2Key @"Task2"
#define kTask3Key @"Task3"
#define kTask4Key @"Task4"
@implementation MADArchive

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_taskone forKey:kTask1Key];
    [aCoder encodeObject:_tasktwo forKey:kTask2Key];
    [aCoder encodeObject:_taskthree forKey:kTask3Key];
    [aCoder encodeObject:_taskfour forKey:kTask4Key];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super init]){
        _taskone = [aDecoder decodeObjectForKey:kTask1Key];
        _tasktwo = [aDecoder decodeObjectForKey:kTask2Key];
        _taskthree = [aDecoder decodeObjectForKey:kTask3Key];
        _taskfour = [aDecoder decodeObjectForKey:kTask4Key];
    }
    return self;
}

-(id)copyWithZone:(NSZone *)zone{
    MADArchive *copy = [[[self class] allocWithZone:zone]init];
    copy.taskone = [self.taskone copyWithZone:zone];
    copy.tasktwo = [self.tasktwo copyWithZone:zone];
    copy.taskthree = [self.taskthree copyWithZone:zone];
    copy.taskfour = [self.taskfour copyWithZone:zone];
    return copy;
}

@end
