//
//  CalendarChooseViewController.m
//  FlashDating
//
//  Created by yishain on 7/14/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//


#import "CalendarViewController.h"
#import "CalendarChooseViewController.h"
#import "SharePageViewController.h"

@interface CalendarChooseViewController () <UITableViewDataSource,UITableViewDelegate>
{
    int i;
    NSDate *newDate;
    NSDateFormatter *format;
    int a ;
}

@property (weak, nonatomic) IBOutlet UITableView *tabelView;
//@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnSend;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigator;

@end

@implementation CalendarChooseViewController

- (void)viewDidLoad {
    a = 0;
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    NSLog(@"num = %d",self.num);
    // Do any additional setup after loading the view.
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    self.labelA = [[UILabel alloc] initWithFrame:CGRectMake(5, 11, 80, 22)];
    self.labelA.backgroundColor = [UIColor clearColor];
    self.labelA.textColor = [UIColor blueColor];
    [[cell contentView] addSubview:self.labelA];
    
    self.labelTime = [[UILabel alloc] initWithFrame:CGRectMake( 160, 11, 40, 22)];
    self.labelTime.backgroundColor = [UIColor clearColor];
    self.labelTime.textColor = [UIColor blackColor];
    [[cell contentView] addSubview:self.labelTime];

//    self.labelTime.text = @"";
   
        NSLog(@"a = %d",a);
    self.labelA.text = self.str1 ;
    self.labelTime.text =  self.str2;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSDate *dateFromString = [dateFormatter dateFromString:self.str1];
        NSLog(@"%@",self.str1);
        
        NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
//        [dateComponents setDay:a];
        dateComponents.day = 1;
        newDate = [[NSCalendar currentCalendar]
                   dateByAddingComponents:dateComponents
                   toDate:dateFromString options:0];
        format = [[NSDateFormatter alloc]init];
        [format setDateFormat:@"yyyy/M/d"];
        self.str1  = [format stringFromDate:newDate];
        NSLog(@"123 = %@",self.str1);
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.num + 1;
}

- (IBAction)btnChoose:(UIButton *)sender {
    sender.selected = !sender.selected;
}
- (IBAction)btnChoose1:(UIButton *)sender {
    sender.selected = !sender.selected;
}
//- (IBAction)btnChoose2:(UIButton *)sender {
//    sender.selected = !sender.selected;
//}

- (IBAction)btnPost:(id)sender {
    SharePageViewController *shareVC = [self.storyboard instantiateViewControllerWithIdentifier:@"shareCell"];
    [self presentViewController:shareVC animated:YES completion:nil];
    //AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //[manager POST:@"https://dojo.alphacamp.co/api/v1/login" parameters:@{@"email": @"billy170916@gmail.com", @"password": @"PEKjadJiE8AJ4T", @"api_key": @"8d7b6db91f21b4ca1a3198dcea481b605e21f4fb"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
    //    [[NSUserDefaults standardUserDefaults] setValue:responseObject[@"auth_token"] forKey:@"auth_token"];
    //    [[NSUserDefaults standardUserDefaults] synchronize];
    //    [indicatorView stopAnimating];
    //    [self performSegueWithIdentifier:@"coursesSegue" sender:self];
    //} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    //    NSLog(@"failure: %@", error);
    //}];
    //}
    
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
