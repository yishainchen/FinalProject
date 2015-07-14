//
//  DateActionViewController.m
//  FlashDating
//
//  Created by yishain on 7/13/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "DateActionViewController.h"
#import "CMPopTipView.h"
@interface DateActionViewController ()<CMPopTipViewDelegate>

@property id < CMPopTipViewDelegate > delegate;
@property CMPopTipView *roundRectButtonPopTipView;

@end

@implementation DateActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.roundRectButtonPopTipView = [[CMPopTipView alloc] initWithMessage:@"請於下方選擇聚會類型"] ;
    self.roundRectButtonPopTipView.delegate = self;
    self.roundRectButtonPopTipView.backgroundColor = [UIColor lightGrayColor];
    self.roundRectButtonPopTipView.textColor = [UIColor darkTextColor];
    self.roundRectButtonPopTipView.has3DStyle = NO;
    [self.roundRectButtonPopTipView presentPointingAtView:self.labelAction inView:self.view animated:YES];
    
    self.btnAction1.layer.cornerRadius = 50;
     self.btnAction2.layer.cornerRadius = 50;
     self.btnAction3.layer.cornerRadius = 50;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnSelected:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    [self.roundRectButtonPopTipView dismissAnimated:YES];
    self.roundRectButtonPopTipView = nil;
    self.roundRectButtonPopTipView = [[CMPopTipView alloc] initWithMessage:@"請點選NEXT進入下一頁"] ;
    self.roundRectButtonPopTipView.delegate = self;
    self.roundRectButtonPopTipView.backgroundColor = [UIColor lightGrayColor];
    self.roundRectButtonPopTipView.textColor = [UIColor darkTextColor];
    [self.roundRectButtonPopTipView presentPointingAtView:self.btnNext1 inView:self.view animated:YES];

}
- (IBAction)btnSelected2:(UIButton *)sender {
    sender.selected = !sender.selected;
    [self.roundRectButtonPopTipView dismissAnimated:YES];
    self.roundRectButtonPopTipView = nil;
    self.roundRectButtonPopTipView = [[CMPopTipView alloc] initWithMessage:@"請點選NEXT進入下一頁"] ;
    self.roundRectButtonPopTipView.delegate = self;
    self.roundRectButtonPopTipView.backgroundColor = [UIColor lightGrayColor];
    self.roundRectButtonPopTipView.textColor = [UIColor darkTextColor];
    [self.roundRectButtonPopTipView presentPointingAtView:self.btnNext1 inView:self.view animated:YES];
}
- (IBAction)btnSelected3:(UIButton *)sender {
    sender.selected = !sender.selected;
    [self.roundRectButtonPopTipView dismissAnimated:YES];
    self.roundRectButtonPopTipView = nil;
    self.roundRectButtonPopTipView = [[CMPopTipView alloc] initWithMessage:@"請點選NEXT進入下一頁"] ;
    self.roundRectButtonPopTipView.delegate = self;
    self.roundRectButtonPopTipView.backgroundColor = [UIColor lightGrayColor];
    self.roundRectButtonPopTipView.textColor = [UIColor darkTextColor];
    [self.roundRectButtonPopTipView presentPointingAtView:self.btnNext1 inView:self.view animated:YES];
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
