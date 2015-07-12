//
//  MyAnnotation.h
//  FlashDating
//
//  Created by yishain on 7/12/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface MyAnnotation : NSObject <MKAnnotation>
-(id)initWithCoordinate:(CLLocationCoordinate2D)argCoordinate
                  title:(NSString*)argTitle subtitle:
(NSString*)argSubtitle;


@end
