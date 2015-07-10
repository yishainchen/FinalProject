//
//  LoginFacebookViewController.m
//  FlashDating
//
//  Created by yishain on 7/9/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "LoginFacebookViewController.h"
#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
@interface LoginFacebookViewController ()

@end

@implementation LoginFacebookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
    // Do any additional setup after loading the view.
    
    //判斷已登入
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fbTokenChangeNoti:) name:FBSDKAccessTokenDidChangeNotification object:nil];
}

-(void)fbTokenChangeNoti:(NSNotification*)noti {

    if ([FBSDKAccessToken currentAccessToken]) {
        
        ViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"Cell"];
        [self presentViewController:VC animated:YES completion:nil];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
