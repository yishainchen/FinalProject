//
//  DateSearchViewController.m
//  FlashDating
//
//  Created by yishain on 7/4/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "DateSearchViewController.h"
#import "TabController.h"
@interface DateSearchViewController ()

@end

@implementation DateSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnBack:(id)sender {
    TabController *tabVC = [self.storyboard instantiateViewControllerWithIdentifier:@"Cell"];
    [self presentViewController:tabVC animated:YES completion:nil];
}
- (IBAction)valueChanged:(UIDatePicker *)sender {
    // NStimeInterval 型態的定義放在NSDate.h中
    // typedef double NSTimeInterval;
    NSTimeInterval n = sender.countDownDuration;
    NSLog(@"倒數計時秒數為 : %.0f",n);
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
