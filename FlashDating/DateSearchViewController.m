//
//  DateSearchViewController.m
//  FlashDating
//
//  Created by yishain on 7/4/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "DateSearchViewController.h"
#import "TabController.h"
#import "ViewController.h"
@interface DateSearchViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableViewSearch;
@end

@implementation DateSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableViewSearch.delegate = self;
    self.tableViewSearch.dataSource = self;
    // Do any additional setup after loading the view.
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
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

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
