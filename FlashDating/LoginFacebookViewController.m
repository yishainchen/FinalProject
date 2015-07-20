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
#import "SphereMenuViewController.h"
#import "AutoLogin.h"
#import <AFNetworking/AFNetworking.h>
@interface LoginFacebookViewController ()<SphereMenuDelegate>
@property (weak,nonatomic) UIImage* image1;
@property (weak,nonatomic) UIImage* image2;
@property (weak,nonatomic) UIImage* image3;
@property (weak,nonatomic) UIImage* image4;
@property (weak,nonatomic) UIImage* image5;
@property (weak,nonatomic) UIImage* image6;
@property (weak,nonatomic) UIImage* image7;
@property (weak,nonatomic) UIImage* image8;
@end

@implementation LoginFacebookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImage *startImage = [UIImage imageNamed:@"logo120"];
    _image1 = [UIImage imageNamed:@"Untitled"];
    _image2 = [UIImage imageNamed:@"Untitled2"];
    _image3 = [UIImage imageNamed:@"Untitled3"];
    _image4 = [UIImage imageNamed:@"Untitled4"];
    _image5 = [UIImage imageNamed:@"Untitled5"];
    _image6 = [UIImage imageNamed:@"Untitled6"];
    _image7 = [UIImage imageNamed:@"Untitled7"];
    _image8 = [UIImage imageNamed:@"Untitled8"];
        NSArray *images = @[self.image1, self.image2, self.image3, self.image4, self.image5, self.image6, self.image7, self.image8];
    SphereMenu *sphereMenu = [[SphereMenu alloc] initWithStartPoint:CGPointMake(160, 120)
                                                         startImage:startImage
                                                      submenuImages:images];
//    [sphereMenu.frame.size.width ;
//    startImage.size.width == self.view.frame.size.width;
    
        sphereMenu.sphereDamping = 0.3;
        sphereMenu.sphereLength = 85;
        sphereMenu.delegate = self;
        [self.view addSubview:sphereMenu];
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
    // Do any additional setup after loading the view.
    
    //判斷已登入
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fbTokenChangeNoti:) name:FBSDKAccessTokenDidChangeNotification object:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    
    if ([AutoLogin isEqualToString:@"NO"]) {
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"isAutoLogin"] != nil) {
            if ([FBSDKAccessToken currentAccessToken] != nil) {
              
                AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
                manager = [AFHTTPRequestOperationManager manager];
                [manager POST:@"https://dojo.alphacamp.co/api/v1/login"
                   parameters:nil
                      success:^(AFHTTPRequestOperation *operation, id responseObject) {
                          AutoLogin = @"YES";
                          ViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"Cell"];
                          [self presentViewController:VC animated:YES completion:nil];

                          
                      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                          
                      }];
            }
            else {
                //                loginButton.hidden = 0;
                [[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"isAutoLogin"];
                [[NSUserDefaults standardUserDefaults] synchronize];
            }
        }
    }
}

//
//-(void)fbTokenChangeNoti:(NSNotification*)noti {
//    if ([FBSDKAccessToken currentAccessToken]) {
//        ViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"Cell"];
//        [self presentViewController:VC animated:YES completion:nil];
//    }
//}

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
