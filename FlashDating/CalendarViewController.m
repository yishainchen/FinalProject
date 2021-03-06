//
//  CalendarViewController.m
//  FlashDating
//
//  Created by yishain on 7/10/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//
#import "LoginFacebookViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "CalendarViewController.h"
#import "SharePageViewController.h"
#import "CalendarChooseViewController.h"
#import "CMPopTipView.h"
#import "AppDelegate.h"
#import "GV.h"
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
   myToken = [FBSDKAccessToken currentAccessToken];
    NSLog(@"token = %@",myToken.tokenString);
    self.roundRectButtonPopTipView = [[CMPopTipView alloc] initWithMessage:@"請於上方選擇開始時間"] ;
    self.roundRectButtonPopTipView.delegate = self;
    self.roundRectButtonPopTipView.backgroundColor = [UIColor greenColor];
    self.roundRectButtonPopTipView.textColor = [UIColor darkTextColor];
    self.roundRectButtonPopTipView.has3DStyle = NO;
    [self.roundRectButtonPopTipView presentPointingAtView:self.datePickerControl inView:self.view animated:YES];
    myDate = [NSDate date];
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"yyyy-MM-dd"];
    getDate = [format stringFromDate:myDate];
    myDate2 =[NSDate date];
    NSDateFormatter *format2 = [[NSDateFormatter alloc]init];
    [format2 setDateFormat:@"yyyy-MM-dd"];
    getDate2 = [format2 stringFromDate:myDate2];
       NSLog(@"%@",getDate2);
//    self.button1.layer.cornerRadius = 10;
//    self.Backbtn.layer.cornerRadius = 10;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDate *today = [NSDate date];
    NSDateFormatter *format3 = [[NSDateFormatter alloc]init];
    [format3 setDateFormat:@"yyyy-MM-dd"];
    getDate3 = [format3 stringFromDate:today];
    [self.lblSelectedDate setText:[NSString stringWithFormat:@"開始時間 :%@",getDate3]];
    [self postdata];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)dateBegin:(UIDatePicker *)sender {
    myDate = [self.datePickerControl date];
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"yyyy-MM-dd"];
    getDate = [format stringFromDate:myDate];
//    NSLog(@"%@",getDate);
    [self.lblSelectedDate setText:[NSString stringWithFormat:@"開始時間 :%@",getDate]];
    [self.roundRectButtonPopTipView dismissAnimated:YES];
    self.roundRectButtonPopTipView = [[CMPopTipView alloc] initWithMessage:@"請於下方選擇結束時間，活動舉辦區間勿大於七天"] ;
    self.roundRectButtonPopTipView.delegate = self;
    self.roundRectButtonPopTipView.backgroundColor = [UIColor greenColor];
    self.roundRectButtonPopTipView.textColor = [UIColor darkTextColor];
    self.roundRectButtonPopTipView.has3DStyle = NO;
    [self.roundRectButtonPopTipView presentPointingAtView:self.datePickerControlEnd inView:self.view animated:YES];
}

- (IBAction)dateEnd:(UIDatePicker *)sender {
    myDate2 = [self.datePickerControlEnd date];
    NSDateFormatter *format = [[NSDateFormatter alloc]init
                               ];
    [format setDateFormat:@"yyyy-MM-dd"];
    getDate2 = [format stringFromDate:myDate2];
    [self.lblSelectedDateEnd setText:[NSString stringWithFormat:@"終止時間 :%@",getDate2]];
     [self.roundRectButtonPopTipView dismissAnimated:YES];
    self.roundRectButtonPopTipView = [[CMPopTipView alloc] initWithMessage:@"請點選認確進入下一頁"] ;
    self.roundRectButtonPopTipView.delegate = self;
    self.roundRectButtonPopTipView.backgroundColor = [UIColor greenColor];
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
    [format2 setDateFormat:@"MM"];
        SeperateDate2 = [format2 stringFromDate:myDate];
        SeperateEnd2 = [format2 stringFromDate:myDate2];
    
    NSDateFormatter *format3 = [[NSDateFormatter alloc]init];
    [format3 setDateFormat:@"dd"];
        SeperateDate3 = [format3 stringFromDate:myDate];
        SeperateEnd3 = [format3 stringFromDate:myDate2];
}

- (IBAction)btnNext:(id)sender {
    [self timeInterval];
    [self seperateDate];
}

-(void)postdata {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:@"http://catchup.today/api/v1/events" parameters:@{
                                                                     @"utf8":@"✓",
                                           @"auth_token":autoken,
                                                                     @"event":@{
                                                                             @"start_date":getDate ,
                                                                                                                                                    @"end_date":getDate2
                                                                             ,@"duration_id":@(30
                                                                                 )
                                                                                 
//                                                                                 @(type)
                                                                             ,
                                                           @"category_id":@(3)
                                                                                 
//                                                                                 @(timeAction)
                                                                             
                                                                             ,},
                                                                     @"commit":@"下一步"}
     
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              [[NSUserDefaults standardUserDefaults] setValue:responseObject[@"auth_token"] forKey:@"auth_token"];
              [[NSUserDefaults standardUserDefaults] synchronize];
              NSLog(@"success");
              NSLog(@"idnum = %@",responseObject);
              self.idNum = responseObject[@"id"];
              NSLog(@"numid = %@",self.idNum);
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"failure: %@", error);
          }];


}


-(void)timeInterval{

    NSTimeInterval interval = [myDate2 timeIntervalSinceDate:myDate];
//    有ＢＵＧ  往上拉日期也會加
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
    self.i =  interval  / (24*60*60);
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    CalendarChooseViewController *VC = segue.destinationViewController;
    VC.num = self.i ;
    VC.str1 = getDate;
    VC.str2 = self.strTime;
    VC.strBegin = getDate;
    VC.strEnd = getDate2;
    VC.identifynum = self.idNum;
    NSLog(@"vc = %@",VC.identifynum);
   }

- (IBAction)backBtn:(id)sender { DateTypeViewController *typeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ActionView"];
    [self presentViewController:typeVC animated:YES completion:nil];
}



-(void) dateAction {
    if ([self.strTime isEqualToString:@"中午"]) {
        type = 10;
    }
    else if ([self.strTime isEqualToString:@"下午"]) {
        type = 20;
    }
    else if ([self.strTime isEqualToString:@"晚上"]) {
        type = 30;
    }
}
- (void)popTipViewWasDismissedByUser:(CMPopTipView *)popTipView {
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)cancalToken:(UIButton *)button{
    FBSDKAccessToken.currentAccessToken = nil;
    LoginFacebookViewController *loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginVC"];
    [self presentViewController:loginVC animated:YES completion:nil];
    //
}
@end

