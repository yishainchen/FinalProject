//
//  InformViewController.m
//  FlashDating
//
//  Created by yishain on 7/18/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "LoginFacebookViewController.h"
#import "InformViewController.h"
#import "DateActionViewController.h"
@interface InformViewController ()

@end

@implementation InformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btn1.layer.cornerRadius = 10;
    self.btn2.layer.cornerRadius = 10;
    self.btnRegister.layer.cornerRadius = 10;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnRegister:(id)sender {
     DateActionViewController  *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"ActionView"];
    [self presentViewController:VC animated:YES completion:nil];
}
- (IBAction)btnInform:(id)sender {
    self.btn1.selected = !self.btn1.selected;
}
- (IBAction)btnInform2:(id)sender {
    self.btn2.selected = !self.btn2.selected;
}



-(IBAction)cancalToken:(UIButton *)button{
    FBSDKAccessToken.currentAccessToken = nil;
    LoginFacebookViewController *loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginVC"];
    [self presentViewController:loginVC animated:YES completion:nil];
    //
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
