//
//  CalendarViewController.m
//  FlashDating
//
//  Created by yishain on 7/10/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "CalendarViewController.h"
#import "SharePageViewController.h"
#import "CalendarChooseViewController.h"
#import "CMPopTipView.h"
#import <AFNetworking/AFNetworking.h>

@interface CalendarViewController ()<CMPopTipViewDelegate>

{
    NSInteger timeAction;
    NSDate *myDate;
    NSDate *myDate2;
    NSString *getDate;
    NSString *getDate2;
    NSString *getDate3;
    NSString *SeperateDate;
    NSString *SeperateDate2;
    NSString *SeperateDate3;
    NSString *SeperateEnd;
    NSString *SeperateEnd2;
    NSString *SeperateEnd3;
    
}
@property id < CMPopTipViewDelegate > delegate;
@property CMPopTipView *roundRectButtonPopTipView;
@property (weak, nonatomic) IBOutlet UILabel *labelStart;
@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.roundRectButtonPopTipView = [[CMPopTipView alloc] initWithMessage:@"請於上方選擇開始時間"] ;
    self.roundRectButtonPopTipView.delegate = self;
    self.roundRectButtonPopTipView.backgroundColor = [UIColor lightGrayColor];
    self.roundRectButtonPopTipView.textColor = [UIColor darkTextColor];
    self.roundRectButtonPopTipView.has3DStyle = NO;
    [self.roundRectButtonPopTipView presentPointingAtView:self.datePickerControl inView:self.view animated:YES];
    myDate = [NSDate date];
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"yyyy/M/d"];
    getDate = [format stringFromDate:myDate];
    myDate2 =[NSDate date];
    NSDateFormatter *format2 = [[NSDateFormatter alloc]init];
    [format2 setDateFormat:@"yyyy/M/d"];
    getDate2 = [format2 stringFromDate:myDate2];
       NSLog(@"%@",getDate2);
    self.button1.layer.cornerRadius = 10;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDate *today = [NSDate date];
    NSDateFormatter *format3 = [[NSDateFormatter alloc]init];
    [format3 setDateFormat:@"yyyy/M/d"];
    getDate3 = [format3 stringFromDate:today];
    [self.lblSelectedDate setText:[NSString stringWithFormat:@"開始時間 :%@",getDate3]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)dateBegin:(UIDatePicker *)sender {
    myDate = [self.datePickerControl date];
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"yyyy/M/d"];
    getDate = [format stringFromDate:myDate];
//    NSLog(@"%@",getDate);
    [self.lblSelectedDate setText:[NSString stringWithFormat:@"開始時間 :%@",getDate]];
    [self.roundRectButtonPopTipView dismissAnimated:YES];
    self.roundRectButtonPopTipView = [[CMPopTipView alloc] initWithMessage:@"請於下方選擇結束時間，活動舉辦區間勿大於十四天"] ;
    self.roundRectButtonPopTipView.delegate = self;
    self.roundRectButtonPopTipView.backgroundColor = [UIColor lightGrayColor];
    self.roundRectButtonPopTipView.textColor = [UIColor darkTextColor];
    self.roundRectButtonPopTipView.has3DStyle = NO;
    [self.roundRectButtonPopTipView presentPointingAtView:self.datePickerControlEnd inView:self.view animated:YES];
}

- (IBAction)dateEnd:(UIDatePicker *)sender {
    myDate2 = [self.datePickerControlEnd date];
    NSDateFormatter *format = [[NSDateFormatter alloc]init
                               ];
    [format setDateFormat:@"yyyy/M/d"];
    getDate2 = [format stringFromDate:myDate2];
    [self.lblSelectedDateEnd setText:[NSString stringWithFormat:@"終止時間 :%@",getDate2]];
     [self.roundRectButtonPopTipView dismissAnimated:YES];
    self.roundRectButtonPopTipView = [[CMPopTipView alloc] initWithMessage:@"請點選認確進入下一頁"] ;
    self.roundRectButtonPopTipView.delegate = self;
    self.roundRectButtonPopTipView.backgroundColor = [UIColor lightGrayColor];
    self.roundRectButtonPopTipView.textColor = [UIColor darkTextColor];
    self.roundRectButtonPopTipView.has3DStyle = NO;
    [self.roundRectButtonPopTipView presentPointingAtView:self.button1 inView:self.view animated:YES];
    NSTimeInterval interval = [myDate2 timeIntervalSinceDate:myDate];
      self.i =  interval / (24*60*60) ;
    NSLog(@"num  = %d",self.i);
}

-(void) seperateDate{

    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"yyyy"];
        SeperateDate = [format stringFromDate:myDate];
        SeperateEnd = [format stringFromDate:myDate2];
    NSDateFormatter *format2 = [[NSDateFormatter alloc]init];
    [format2 setDateFormat:@"M"];
        SeperateDate2 = [format stringFromDate:myDate];
        SeperateEnd2 = [format stringFromDate:myDate2];
    NSDateFormatter *format3 = [[NSDateFormatter alloc]init];
    [format3 setDateFormat:@"d"];
        SeperateDate3 = [format stringFromDate:myDate];
        SeperateEnd3 = [format stringFromDate:myDate2];
}


//- (IBAction)btnLocalPush:(id)sender {
//    UILocalNotification *localNotification = [[UILocalNotification alloc]init];
////    NSCalendar *calender = [NSCalendar currentCalendar];
//    NSDate *notiDate = [NSDate dateWithTimeIntervalSinceNow:3];
//    localNotification.fireDate = notiDate;
////    localNotification.soundName = @"";
//    localNotification.alertAction = @"新增聚會成功";
////    localNotification.repeatInterval = NSCalendarUnitMonth;
//    localNotification.soundName = UILocalNotificationDefaultSoundName;
//    localNotification.applicationIconBadgeNumber = 1;
//    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
//    
//}


- (IBAction)btnNext:(id)sender {
    [self timeInterval];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:@"http://catchup.today/api/v1/events" parameters:@{
                                                              @"utf8":@"✓",                                                               @"event":@{@"start_date(1i)":@"SeperateDate", @"start_date(2i)":@"SeperateDate2",                                                                    @"start_date(3i)":@"SeperateDate3",                                                                              @"end_date(1i)":@"SeperateEnd",                                                                                  @"end_date(2i)":@"SeperateEnd2",
                                                            @"end_date(3i)":@"SeperateEnd3"},                                                              @"commit":@"Create Event"}
     
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              [[NSUserDefaults standardUserDefaults] setValue:responseObject[@"auth_token"] forKey:@"auth_token"];
              [[NSUserDefaults standardUserDefaults] synchronize];
              NSLog(@"success");
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"failure: %@", error);
          }];
}




-(void)timeInterval{

    NSTimeInterval interval = [myDate2 timeIntervalSinceDate:myDate];
//    NSLog(@"Time  =  %f", interval);
        if (interval >=  1209600 ) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"超過選擇區間" message:@"請重新選擇" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:nil];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertViewStyleDefault handler:^(UIAlertAction *action) {
            [alert dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:cancel];
    }
        else if (interval < 0) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"選擇區間錯誤" message:@"請確認起始點小於終點" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:nil];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertViewStyleDefault handler:^(UIAlertAction *action) {
            [alert dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:cancel];
    }
        else {
        [self performSegueWithIdentifier:@"SharePG" sender:self];
    }
    self.i =  interval / (24*60*60);
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    CalendarChooseViewController *VC = segue.destinationViewController;
    VC.num = self.i;
    VC.str1 = getDate;
    VC.str2 = self.strTime;
    VC.strBegin = getDate;
    VC.strEnd = getDate2;
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

