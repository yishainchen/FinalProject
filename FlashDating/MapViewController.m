//
//  MapViewController.m
//  FlashDating
//
//  Created by yishain on 7/12/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "MapViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
@interface MapViewController ()<MKMapViewDelegate, CLLocationManagerDelegate>

{
    BOOL isFirstGetLocation;
    CLLocationManager *locationManager;
    IBOutlet MKMapView *myMapView;
    MKPointAnnotation *annotation;
    CLLocationCoordinate2D coordinateUserGoal;
    IBOutlet UILabel *labelMap;

}
@property (nonatomic) CLLocationCoordinate2D centerCoordinate;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    myMapView.delegate = self;
    isFirstGetLocation = NO;
    [locationManager startUpdatingLocation];
    locationManager = [[CLLocationManager alloc]
                                          init];
    [locationManager requestWhenInUseAuthorization];
    annotation = [[MKPointAnnotation alloc]init];
    annotation.title = @"聚會地點";
    annotation.subtitle = @"";
    annotation.coordinate = CLLocationCoordinate2DMake(25.0740, 121.3726);

    [myMapView addAnnotation:annotation];
    // Do any additional setup after loading the view.
     [CLLocationManager authorizationStatus];
}


- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
   
};

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:
(MKUserLocation *)userLocation
{
    if(isFirstGetLocation == NO) {
        isFirstGetLocation = YES;
        MKCoordinateRegion region ;
        region.center = userLocation.location.coordinate;
        MKCoordinateSpan mapSpan;
        mapSpan.latitudeDelta = 0.005;
        mapSpan.longitudeDelta = 0.005;
        region.span = mapSpan;
        mapView.region = region;
    }
    mapView.region =
    MKCoordinateRegionMakeWithDistance(userLocation.location.coordinate,
                                       1000, 1000 );
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    CLLocation *old = [[CLLocation alloc] initWithLatitude:25.033408 longitude:121.564099];
    NSLog(@"eric is %@",old);
    CLLocationDistance distance = [newLocation distanceFromLocation:old];
    
    labelMap.text = [NSString stringWithFormat:@"距離101尚有%f 公尺",distance];
    NSLog(@"count ==== %f",distance);
}
//-(void)addAnnotation {
//   coordinateUserGoal = CLLocationCoordinate2DMake(25.033408, 121.564011);
//   [myMapView addAnnotation:annotation];
//   
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
