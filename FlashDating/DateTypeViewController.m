//
//  DateTypeViewController.m
//  FlashDating
//
//  Created by yishain on 7/10/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "DateTypeViewController.h"
#import "CMPopTipView.h"
#import "CalendarChooseViewController.h"
#import "DateActionViewController.h"
#import "CalendarViewController.h"
@interface DateTypeViewController () <CMPopTipViewDelegate>
{
    }
//@property id < CMPopTipViewDelegate > delegate;
@property CMPopTipView *roundRectButtonPopTipView;

@property (weak, nonatomic) IBOutlet UIButton *btnType1;

@property (weak, nonatomic) IBOutlet UIButton *btnType2;
@property (weak, nonatomic) IBOutlet UIButton *btnType3;

@property (weak, nonatomic) IBOutlet UILabel *lableDate;

@property (weak, nonatomic) IBOutlet UIButton *btnNext;
@end

@implementation DateTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.roundRectButtonPopTipView = [[CMPopTipView alloc] initWithMessage:@"請於下方選擇聚會時段，若下列時段均有聚會舉辦意願，請重複勾選"] ;
    self.roundRectButtonPopTipView.delegate = self;
    self.roundRectButtonPopTipView.backgroundColor = [UIColor lightGrayColor];
    self.roundRectButtonPopTipView.textColor = [UIColor darkTextColor];
    self.roundRectButtonPopTipView.has3DStyle = NO;
    [self.roundRectButtonPopTipView presentPointingAtView:self.lableDate inView:self.view animated:YES];

    self.btnType1.layer.cornerRadius = 50;
    self.btnType2.layer.cornerRadius = 50;
    self.btnType3.layer.cornerRadius = 50;
    
    CMPopTipView *navBarLeftButtonPopTipView = [[CMPopTipView alloc] initWithMessage:@"A Message"];
    navBarLeftButtonPopTipView.delegate = self;
    [navBarLeftButtonPopTipView presentPointingAtBarButtonItem:self.navigationItem.leftBarButtonItem animated:YES];
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
    self.roundRectButtonPopTipView = [[CMPopTipView alloc] initWithMessage:@"請點選NEXT進入下一頁"] ;
    self.roundRectButtonPopTipView.delegate = self;
    self.roundRectButtonPopTipView.backgroundColor = [UIColor lightGrayColor];
    self.roundRectButtonPopTipView.textColor = [UIColor darkTextColor];
    [self.roundRectButtonPopTipView presentPointingAtView:self.btnNext inView:self.view animated:YES];
}
- (IBAction)btnType2:(UIButton *)sender {
    sender.selected = !sender.selected;
    [self.roundRectButtonPopTipView dismissAnimated:YES];
    self.roundRectButtonPopTipView = nil;
    self.roundRectButtonPopTipView = [[CMPopTipView alloc] initWithMessage:@"請點選NEXT進入下一頁"] ;
    self.roundRectButtonPopTipView.delegate = self;
    self.roundRectButtonPopTipView.backgroundColor = [UIColor lightGrayColor];
    self.roundRectButtonPopTipView.textColor = [UIColor darkTextColor];
    [self.roundRectButtonPopTipView presentPointingAtView:self.btnNext inView:self.view animated:YES];

    
}
- (IBAction)btnType3:(UIButton *)sender {
    sender.selected = !sender.selected;
    [self.roundRectButtonPopTipView dismissAnimated:YES];
    self.roundRectButtonPopTipView = nil;
    self.roundRectButtonPopTipView = [[CMPopTipView alloc] initWithMessage:@"請點選NEXT進入下一頁"] ;
    self.roundRectButtonPopTipView.delegate = self;
    self.roundRectButtonPopTipView.backgroundColor = [UIColor lightGrayColor];
    self.roundRectButtonPopTipView.textColor = [UIColor darkTextColor];
    [self.roundRectButtonPopTipView presentPointingAtView:self.btnNext inView:self.view animated:YES];

}
- (IBAction)btnBackInform:(id)sender {
    DateActionViewController *actionVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ActionView"];
    [self presentViewController:actionVC animated:YES completion:nil];
}

#pragma mark CMPopTipViewDelegate methods
- (void)popTipViewWasDismissedByUser:(CMPopTipView *)popTipView {
    // User can tap CMPopTipView to dismiss it
    self.roundRectButtonPopTipView = nil;
}

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


/*#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
