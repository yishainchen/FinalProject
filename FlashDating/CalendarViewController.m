//
//  CalendarViewController.m
//  FlashDating
//
//  Created by yishain on 7/10/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "CalendarViewController.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)dateBegin:(UIDatePicker *)sender {
}


- (IBAction)dateEnd:(UIDatePicker *)sender {
}

- (IBAction)btnLocalPush:(id)sender {
    UILocalNotification *localNotification = [[UILocalNotification alloc]init];
//    NSCalendar *calender = [NSCalendar currentCalendar];
   
    NSDate *notiDate = [NSDate dateWithTimeIntervalSinceNow:3];
    localNotification.fireDate = notiDate;
//    localNotification.soundName = @"";
    localNotification.alertAction = @"新增聚會成功";
//    localNotification.repeatInterval = NSCalendarUnitMonth;
    
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.applicationIconBadgeNumber = 1;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
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
