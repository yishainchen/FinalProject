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
#import <AFNetworking.h>
@interface SharePageViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnShare;

@property (strong, nonatomic) NSString *webAddressed;

@end

@implementation SharePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.notiTime.text = self.str2;
    self.btnShare.layer.cornerRadius = 10;
    [self loadAddressed];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backHome:(id)sender {
    ViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"Cell"];
    [self presentViewController:VC animated:YES completion:nil];
}

- (void)loadAddressed {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://dojo.alphacamp.co/api/v1/courses" parameters:
     @{@"api_key": @"8d7b6db91f21b4ca1a3198dcea481b605e21f4fb",
       @"auth_token": [[NSUserDefaults standardUserDefaults] valueForKey:@"auth_token"]}
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
//             [self.tableView reloadData];
             NSLog(@"response: %@", responseObject);
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
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
