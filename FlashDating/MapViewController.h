//
//  MapViewController.h
//  FlashDating
//
//  Created by yishain on 7/12/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"
@interface MapViewController : UIViewController @property (nonatomic) BOOL showsUserLocation;
@property (nonatomic, readonly) MKUserLocation *userLocation;
- (void)requestAlwaysAuthorization;

@end
