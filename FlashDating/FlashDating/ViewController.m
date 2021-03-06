//
//  ViewController.m
//  FlashDating
//
//  Created by yishain on 6/30/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//
#import "LoginFacebookViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "ViewController.h"
#import "LineActivity.h"
#import <Parse/Parse.h>
#import "DateSearchViewController.h"
#import <AFNetworking/AFNetworking.h>
//#import "SphereMenuViewController.h"

@interface ViewController ()
{
    NSMutableArray *events;
}
@property (weak, nonatomic) IBOutlet UIButton *btnDate1;
@property (weak, nonatomic) IBOutlet UIButton *btnDate2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnDate1.layer.cornerRadius = 15;
    self.btnDate2.layer.cornerRadius = 15;
  
//  
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    testObject[@"foo"] = @"bar";
//    [testObject saveInBackground];
//    
    // Do any additional setup after loading the view, typically from a nib.
    [self loadCourses];
    
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"首頁";
}

- (void)loadCourses {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://cryptic-oasis-8248.herokuapp.com/api/v1/events" parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             [events addObject:responseObject[@"data"]];
             
             for (NSDictionary *dict in responseObject[@"data"]) {
                 NSLog(@"eric %@",dict[@"availabilities"]);
             }
             
//             NSLog(@"eric %@",responseObject[@"data"]);
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"failure: %@", error);
         }];

}
//@"api_key": @"8d7b6db91f21b4ca1a3198dcea481b605e21f4fb",
//@"auth_token": [[NSUserDefaults standardUserDefaults] valueForKey:@"auth_token"]


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dateSearch:(id)sender {
   DateSearchViewController *dateVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DateSearch"];
    [self presentViewController:dateVC animated:YES completion:nil];
    
    [PFCloud callFunctionInBackground:@"hello" withParameters:[NSDictionary new] block:^(id object,NSError *error) {
        if (!error) {
            NSLog(@"great");
        }
    }];
}

-(IBAction)cancalToken:(UIButton *)button{
    FBSDKAccessToken.currentAccessToken = nil;
    LoginFacebookViewController *loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginVC"];
    [self presentViewController:loginVC animated:YES completion:nil];
    //
}


- (IBAction)alertBtn:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"聚會邀請已回覆" message:@"請前往查詢頁面確認聚會日期" preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:nil];

     UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"確定" style:UIAlertViewStyleDefault handler:^(UIAlertAction *action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
            }];
    [alert addAction:cancel];
}


@end
