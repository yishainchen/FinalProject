//
//  DateActionViewController.m
//  FlashDating
//
//  Created by yishain on 7/13/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "LoginFacebookViewController.h"
#import "DateActionViewController.h"
#import "CMPopTipView.h"
#import "DateTypeViewController.h"
#import "InformViewController.h"
#import "AppDelegate.h"
#import "CalendarViewController.h"
@interface DateActionViewController ()<CMPopTipViewDelegate>

@property id < CMPopTipViewDelegate > delegate;
@property CMPopTipView *roundRectButtonPopTipView;
@property (weak, nonatomic) IBOutlet UIButton *btnType1;
@property (weak, nonatomic) IBOutlet UIButton *btnType2;
@property (weak, nonatomic) IBOutlet UIButton *btnType3;
@property (weak, nonatomic) IBOutlet UILabel *lableDate;
@end

@implementation DateActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.roundRectButtonPopTipView = [[CMPopTipView alloc] initWithMessage:@"請於上方選擇一個聚會時段"] ;
    self.roundRectButtonPopTipView.delegate = self;
    self.roundRectButtonPopTipView.backgroundColor = [UIColor lightGrayColor];
    self.roundRectButtonPopTipView.textColor = [UIColor darkTextColor];
    self.roundRectButtonPopTipView.has3DStyle = NO;
    [self.roundRectButtonPopTipView presentPointingAtView:self.lableDate inView:self.view animated:YES];
    
//    self.roundRectButtonPopTipView = [[CMPopTipView alloc] initWithMessage:@"請於下方選擇聚會類型"] ;
//    self.roundRectButtonPopTipView.delegate = self;
//    self.roundRectButtonPopTipView.backgroundColor = [UIColor lightGrayColor];
//    self.roundRectButtonPopTipView.textColor = [UIColor darkTextColor];
//    self.roundRectButtonPopTipView.has3DStyle = NO;
//    [self.roundRectButtonPopTipView presentPointingAtView:self.labelAction inView:self.view animated:YES];
//    
    self.btnAction1.layer.cornerRadius = 50;
    self.btnAction2.layer.cornerRadius = 50;
    self.btnAction3.layer.cornerRadius = 50;
    self.btnType1.layer.cornerRadius = 50;
    self.btnType2.layer.cornerRadius = 50;
    self.btnType3.layer.cornerRadius = 50;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnType1:(UIButton *)sender {
    sender.selected = !sender.selected;
   
    
    [self.roundRectButtonPopTipView dismissAnimated:YES];
    self.roundRectButtonPopTipView = nil;
    self.roundRectButtonPopTipView = [[CMPopTipView alloc] initWithMessage:@"請於下方選擇聚會類型"] ;
    self.roundRectButtonPopTipView.delegate = self;
    self.roundRectButtonPopTipView.backgroundColor = [UIColor lightGrayColor];
    self.roundRectButtonPopTipView.textColor = [UIColor darkTextColor];
    [self.roundRectButtonPopTipView presentPointingAtView:self.labelAction inView:self.view animated:YES];
    if (sender.selected) {
        self.btnType2.selected = NO;
        self.btnType3.selected = NO;
    }
}
- (IBAction)btnType2:(UIButton *)sender {
    sender.selected = !sender.selected;
   
    [self.roundRectButtonPopTipView dismissAnimated:YES];
    self.roundRectButtonPopTipView = nil;
    self.roundRectButtonPopTipView = [[CMPopTipView alloc] initWithMessage:@"請於下方選擇聚會類型"] ;
    self.roundRectButtonPopTipView.delegate = self;
    self.roundRectButtonPopTipView.backgroundColor = [UIColor lightGrayColor];
    self.roundRectButtonPopTipView.textColor = [UIColor darkTextColor];
    [self.roundRectButtonPopTipView presentPointingAtView:self.labelAction inView:self.view animated:YES];
    if (sender.selected) {
        self.btnType1.selected = NO;
        self.btnType3.selected = NO;
    }
    
}
- (IBAction)btnType3:(UIButton *)sender {
    sender.selected = !sender.selected;

    [self.roundRectButtonPopTipView dismissAnimated:YES];
    self.roundRectButtonPopTipView = nil;
    self.roundRectButtonPopTipView = [[CMPopTipView alloc] initWithMessage:@"請於下方選擇聚會類型"] ;
    self.roundRectButtonPopTipView.delegate = self;
    self.roundRectButtonPopTipView.backgroundColor = [UIColor lightGrayColor];
    self.roundRectButtonPopTipView.textColor = [UIColor darkTextColor];
    [self.roundRectButtonPopTipView presentPointingAtView:self.labelAction inView:self.view animated:YES];
    if (sender.selected) {
        self.btnType1.selected = NO;
        self.btnType2.selected = NO;
    }
}


- (IBAction)btnSelected:(UIButton *)sender {
    sender.selected = !sender.selected;
    DateTypeViewController *typeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"calendarVC"];
    [self presentViewController:typeVC animated:YES completion:nil];
    AppDelegate *delegate = [[UIApplication sharedApplication]
                             delegate];
    delegate.Action = 1;

    [self.roundRectButtonPopTipView dismissAnimated:YES];
    self.roundRectButtonPopTipView = nil;
    self.roundRectButtonPopTipView = [[CMPopTipView alloc] initWithMessage:@"請點選NEXT進入下一頁"] ;
    self.roundRectButtonPopTipView.delegate = self;
    self.roundRectButtonPopTipView.backgroundColor = [UIColor lightGrayColor];
    self.roundRectButtonPopTipView.textColor = [UIColor darkTextColor];
    [self.roundRectButtonPopTipView presentPointingAtView:self.labelAction inView:self.view animated:YES];

}
- (IBAction)btnSelected2:(UIButton *)sender {
    sender.selected = !sender.selected;
    DateTypeViewController *typeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"calendarVC"];
    [self presentViewController:typeVC animated:YES completion:nil];
    
    AppDelegate *delegate = [[UIApplication sharedApplication]
                             delegate];
    delegate.Action = 2;

    [self.roundRectButtonPopTipView dismissAnimated:YES];
    self.roundRectButtonPopTipView = nil;
    self.roundRectButtonPopTipView = [[CMPopTipView alloc] initWithMessage:@"請點選NEXT進入下一頁"] ;
    self.roundRectButtonPopTipView.delegate = self;
    self.roundRectButtonPopTipView.backgroundColor = [UIColor lightGrayColor];
    self.roundRectButtonPopTipView.textColor = [UIColor darkTextColor];
    [self.roundRectButtonPopTipView presentPointingAtView:self.labelAction inView:self.view animated:YES];
}
- (IBAction)btnSelected3:(UIButton *)sender {
    sender.selected = !sender.selected;
    DateTypeViewController *typeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"calendarVC"];
    [self presentViewController:typeVC animated:YES completion:nil];
    AppDelegate *delegate = [[UIApplication sharedApplication]
                             delegate];
    delegate.Action = 3;

    [self.roundRectButtonPopTipView dismissAnimated:YES];
    self.roundRectButtonPopTipView = nil;
    self.roundRectButtonPopTipView = [[CMPopTipView alloc] initWithMessage:@"請點選NEXT進入下一頁"] ;
    self.roundRectButtonPopTipView.delegate = self;
    self.roundRectButtonPopTipView.backgroundColor = [UIColor lightGrayColor];
    self.roundRectButtonPopTipView.textColor = [UIColor darkTextColor];
    [self.roundRectButtonPopTipView presentPointingAtView:self.btnNext1 inView:self.view animated:YES];
}
- (IBAction)btnBackChoose:(id)sender {
    InformViewController *type = [self.storyboard instantiateViewControllerWithIdentifier:@"informCell"];
    [self presentViewController:type animated:YES completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CalendarViewController *calendarVC = segue.destinationViewController;
    if (self.btnType1.selected) {
        calendarVC.strTime = @"中午";
    }
    if (self.btnType2.selected) {
        calendarVC.strTime = @"下午";
    }
    if (self.btnType3.selected) {
        calendarVC.strTime = @"晚上";
    }
    
}

@end
