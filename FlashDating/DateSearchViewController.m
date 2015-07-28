//
//  DateSearchViewController.m
//  FlashDating
//
//  Created by yishain on 7/4/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "HostViewController.h"
#import "LoginFacebookViewController.h"
#import "DateSearchViewController.h"
#import "TabController.h"
#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
@interface DateSearchViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableViewSearch;
@end

@implementation DateSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableViewSearch.delegate = self;
    self.tableViewSearch.dataSource = self;
    // Do any additional setup after loading the view.
    [self getdata];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil){
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    return cell;
    
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200.0f;
}

- (IBAction)btnBack:(id)sender {
    ViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"Cell"];
    [self presentViewController:VC animated:YES completion:nil];
}

-(void)getdata {
AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:@"http://catchup.today/api/v1/events" parameters:@{@"event_id":@"24"}
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSLog(@"success");
             NSLog(@"response: %@", responseObject);
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"failure: %@", error);
         }];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (IBAction)decideDate:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"聚會日期確定" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:nil];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"確定" style:UIAlertViewStyleDefault handler:^(UIAlertAction *action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:cancel];
    ViewController *hostVC = [self.storyboard instantiateViewControllerWithIdentifier:@"hostVC"];
    [self presentViewController:hostVC animated:
     YES completion:nil];
}

-(IBAction)Back{
   
    HostViewController *hostVC = [self.storyboard instantiateViewControllerWithIdentifier:@"hostVC"];
    [self presentViewController:hostVC animated:
     YES completion:nil];
    //
}
@end
