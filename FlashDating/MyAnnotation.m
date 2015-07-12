//
//  MyAnnotation.m
//  FlashDating
//
//  Created by yishain on 7/12/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//


#import "MyAnnotation.h"

@implementation MyAnnotation

@synthesize coordinate;
@synthesize title;
@synthesize subtitle;
-(id)initWithCoordinate:(CLLocationCoordinate2D)argCoordinate title:

(NSString*)argTitle subtitle:(NSString*)argSubtitle
{
    self = [super init];
    if(self)
    {
        coordinate = argCoordinate;
        title = argTitle;
        subtitle = argSubtitle;
    }
    return self;
}

@end