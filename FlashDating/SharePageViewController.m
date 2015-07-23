//
//  SharePageViewController.m
//  FlashDating
//
//  Created by yishain on 7/10/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "SharePageViewController.h"
#import "LineActivity.h"
#import "ViewController.h"
#import <FBSDKShareKit/FBSDKShareLinkContent.h>
#import <FBSDKShareKit/FBSDKShareDialog.h>
#import <FBSDKCoreKit/FBSDKGraphRequest.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <AFNetworking/AFNetworking.h>

//#import <
@interface SharePageViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnShare;
@property (strong, nonatomic) NSString *webAddressed;

@end

@implementation SharePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.notiTime.text = self.str2;
    self.btnShare.layer.cornerRadius = 10;
    
    
    
//    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
//    content.contentURL = [NSURL URLWithString:@"https://developers.facebook.com"];
//                          [FBSDKShareDialog showFromViewController:self
//                                                       withContent:content
//                                                          delegate:nil];

    // Do any additional setup after loading the view.
    
    if ([[FBSDKAccessToken currentAccessToken] hasGranted:@"publish_actions"]) {
        [self post];
    }
    else {
        FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
        [login logInWithPublishPermissions:@[@"publish_actions"]
                                   handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                       if (error) {
                                           // Process error
                                       } else if (result.isCancelled) {
                                           // Handle cancellations
                                       } else {
                                           [self post];
                                       } }];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backHome:(id)sender {
    
    ViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"Cell"];
    [self presentViewController:VC animated:YES completion:nil];
}

-(void)post {
//    [[[FBSDKGraphRequest alloc]
//      initWithGraphPath:@"me/feed"
//      parameters: @{ @"message" : @"hello world"}
//      HTTPMethod:@"POST"]
//     startWithCompletionHandler:^(FBSDKGraphRequestConnection
//                                  *connection, id result, NSError *error) {
//         if (!error) {
//             NSLog(@"Post id:%@", result[@"id"]);
//         } }];
//    

}

- (void)loadAdressed {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://cryptic-oasis-8248.herokuapp.com/api/v1/events" parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSLog(@"response: %@", responseObject);
//             self.webAddressed.text = responseObject;
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"failure: %@", error);
         }];
}


- (IBAction)ShowInvitePage:(id)sender {
    UIImage *image = [UIImage imageNamed:@"Flashdate"];
    NSArray *array = @[@"Hello",image];
    LineActivity *line = [[LineActivity alloc ]init];
    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:array   applicationActivities:@[line]];
    controller.excludedActivityTypes = @[UIActivityTypePostToFacebook];
    
    [self presentViewController:controller animated:YES completion:nil];
    
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
