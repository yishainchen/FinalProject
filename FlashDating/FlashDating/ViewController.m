//
//  ViewController.m
//  FlashDating
//
//  Created by yishain on 6/30/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "ViewController.h"
#import "LineActivity.h"
#import <Parse/Parse.h>
#import "DateSearchViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)ShowInvitePage:(id)sender {
    UIImage *image = [UIImage imageNamed:@"Flashdate"];
    NSArray *array = @[@"Hello",image];
    LineActivity *line = [[LineActivity alloc ]init];
    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:array   applicationActivities:@[line]];
    controller.excludedActivityTypes = @[UIActivityTypePostToFacebook];
    
    [self presentViewController:controller animated:YES completion:nil];
    
}

- (IBAction)btnLocalPush:(id)sender {
    UILocalNotification *localNotification = [[UILocalNotification alloc]init];
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSDate *notiDate = [calender dateWithEra:1 year:2015 month:8 day:2 hour:10 minute:00 second:00 nanosecond:00];
    localNotification.fireDate = notiDate;
    localNotification.soundName = @"";
    localNotification.alertAction = @"";
    localNotification.repeatInterval = NSCalendarUnitMonth;
    
    localNotification.soundName = UILocalNotificationDefaultSoundName; localNotification.applicationIconBadgeNumber = 1;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

- (IBAction)dateSearch:(id)sender {
   DateSearchViewController *dateVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DateSearch"];
    [self presentViewController:dateVC animated:YES completion:nil];
    
}


@end
