//
//  CalendarViewController.m
//  FlashDating
//
//  Created by yishain on 7/10/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "CalendarViewController.h"
#import "SharePageViewController.h"
@interface CalendarViewController ()
{
    NSDate *myDate;
    NSDate *myDate2;
    NSString *getDate;
    NSString *getDate2;
}
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
    myDate = [self.datePickerControl date];
    NSDateFormatter *format = [[NSDateFormatter alloc]init
                               ];
    [format setDateFormat:@"yyyy/M/d"];
    getDate = [format stringFromDate:myDate];
    NSLog(@"%@",getDate);
    [self.lblSelectedDate setText:[NSString stringWithFormat:@"開始時間 :%@",getDate]];
}


- (IBAction)dateEnd:(UIDatePicker *)sender {
    myDate2 = [self.datePickerControlEnd date];
    NSDateFormatter *format = [[NSDateFormatter alloc]init
                               ];
    [format setDateFormat:@"yyyy/M/d"];
    getDate2 = [format stringFromDate:myDate];
    NSLog(@"%@",getDate2);
    [self.lblSelectedDateEnd setText:[NSString stringWithFormat:@"終止時間 :%@",getDate2]];
    [self timeInterval];
    
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SharePageViewController *shareVC = segue.destinationViewController;
    [shareVC.notiTime setText:[NSString stringWithFormat:@"活動舉辦區間為%@ ~%@",getDate,getDate2]];
    NSLog(@"%@",getDate);
   
}

-(void)timeInterval{

NSTimeInterval interval = myDate2.timeIntervalSinceReferenceDate;
NSLog(@"%f", interval);
NSDate *date = [NSDate dateWithTimeInterval:interval sinceDate:myDate];
    NSLog(@"interval = %@",date);
[self getDataString:date];
    
}

-(void)getDataString:(NSDate*)date {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterLongStyle;
    dateFormatter.timeStyle = NSDateFormatterLongStyle;
    NSString *str = [dateFormatter stringFromDate:date];
    NSLog(@"str %@", str);
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
