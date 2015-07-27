//
//  CalendarChooseViewController.m
//  FlashDating
//
//  Created by yishain on 7/14/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "LoginFacebookViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "CalendarViewController.h"
#import "CalendarChooseViewController.h"
#import "SharePageViewController.h"
#import "EricTableViewCell.h"
#import <AFNetworking/AFNetworking.h>
#import "DateActionViewController.h"
#import "CMPopTipView.h"
#import "AppDelegate.h"

@interface CalendarChooseViewController () <UITableViewDataSource,UITableViewDelegate>
{
    int i;
    int a ;
    int type;
    NSDate *newDate;
    NSDate *nowDate;
    NSInteger timeAction;
    NSNumber* flashNum;
    NSDateFormatter *format;
    NSMutableArray *mutableArr;
    NSMutableArray *resetArr;
    NSDictionary *dict;
    NSMutableDictionary *resetdic;
    NSString *datestring;
    NSCalendar *current;
    UIButton *iv1;
    NSString *strToday;
    NSString *strNum;
    NSString *url;
    
}

@property (weak, nonatomic) IBOutlet UITableView *tabelView;

@end

@implementation CalendarChooseViewController

- (void)viewDidLoad {
//    resetdic = [[NSMutableDictionary alloc]init];
    flashNum = self.identifynum;
    strNum = [NSString stringWithFormat:@"%@",flashNum];
    NSLog(@"strnum = %@" ,strNum);
    AppDelegate *delegate = [[UIApplication sharedApplication]
                             delegate];
    resetArr = [[NSMutableArray alloc]init];
    dict = [[NSMutableDictionary alloc]init];
    a = 0;
    type = 0;
    NSInteger Action;
    timeAction  = delegate.Action;
    datestring = self.strBegin;
    mutableArr = [[NSMutableArray alloc] init];
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    current =  [NSCalendar currentCalendar];
    url =[@"http://catchup.today/api/v1/events/" stringByAppendingFormat:@"%@",strNum];

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EricTableViewCell *cell = (EricTableViewCell *) [self.tabelView cellForRowAtIndexPath:indexPath];
    cell.labelDate.text = self.str1;
     cell.tag = indexPath.row+1;
    static NSString *CellIdentifier = @"Cell";
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    self.labelA = [[UILabel alloc] initWithFrame:CGRectMake(5, 11, 80, 22)];
//    self.labelA.backgroundColor = [UIColor clearColor];
//    self.labelA.textColor = [UIColor blueColor];
//    [[cell contentView] addSubview:self.labelA];
    
    self.labelTime = [[UILabel alloc] initWithFrame:CGRectMake( 160, 11, 40, 22)];
    self.labelTime.backgroundColor = [UIColor clearColor];
    self.labelTime.textColor = [UIColor blackColor];
    [[cell contentView] addSubview:self.labelTime];

//    self.labelTime.text = @"";
   
        NSLog(@"a = %d",a);
        cell.labelDate.text = self.str1 ;
        self.labelTime.text =  self.str2;
       [self dateAction];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSDate *dateFromString = [dateFormatter dateFromString:self.str1];
    
        NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
        dateComponents.day = 1;
        newDate = [[NSCalendar currentCalendar]
                   dateByAddingComponents:dateComponents
                   toDate:dateFromString  options:0];
        NSDate *today = [NSDate date];
    
        format = [[NSDateFormatter alloc]init];
        [format setDateFormat:@"yyyy-MM-dd"];
    
        strToday = [format stringFromDate:today];
    
        self.str1  = [format stringFromDate:newDate];
    
        iv1 = (UIButton *)[cell viewWithTag:1];
        iv1.tag = indexPath.row ;
        [iv1 addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    
        if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        return cell;
   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  }


- (IBAction)backBtn:(id)sender {
    CalendarViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"calendarVC"];
    [self presentViewController:VC animated:YES completion:nil];
}



-(void)buttonTapped:(UIButton *)sender {
    NSIndexPath *indexPath = [NSIndexPath
                              indexPathForRow:sender.tag
                              inSection:0];
    EricTableViewCell *cell = (EricTableViewCell *) [self.tabelView cellForRowAtIndexPath:indexPath];
    dict = [NSDictionary dictionaryWithObjectsAndKeys:cell.labelDate.text,@"range",nil];
 
    [resetArr addObject:dict];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    NSLog(@"begin = %@",self.strBegin);
    NSLog(@"today = %@",   strToday);
    NSLog(@"end = %@",self.strEnd);
    
    if ([self.strBegin isEqualToString:strToday])  {
        
        
        if ([self.strEnd isEqualToString:strToday]) {
            return self.num + 1;
        }
        return self.num + 2;
    }
    else {
       return self.num + 1;
    }
}

//- (IBAction)btnChoose:(UIButton *)sender {
//    sender.selected = !sender.selected;
//}

- (IBAction)btnChoose1:(UIButton *)sender {
    sender.backgroundColor = sender.selected ? [UIColor blueColor] : [UIColor greenColor];
    sender.selected = !sender.selected;
}

-(void) dateAction {
    if ([self.labelTime.text isEqualToString:@"中午"]) {
        type = 10;
    }
    else if ([self.labelTime.text isEqualToString:@"下午"]) {
        type = 20;
    }
    else if ([self.labelTime.text isEqualToString:@"晚上"]) {
        type = 30;
    }
}
- (IBAction)btnPost:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"新增成功" message:@"下一步邀請好友參加聚會" preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:nil];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"確定" style:UIAlertViewStyleDefault handler:^(UIAlertAction *action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
        [self performSegueWithIdentifier:@"urlPG" sender:self];
//        SharePageViewController *shareVC = [self.storyboard instantiateViewControllerWithIdentifier:@"shareCell"];
//        [self presentViewController:shareVC animated:YES completion:nil];
    }];
    [alert addAction:cancel];

    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:mutableArr options:NSJSONWritingPrettyPrinted error:&error];
    NSString *body = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager PUT:url parameters:@{
                                                                                                @"utf8":@"✓",
                                  
                                                                                      @"event":@{@"category_id":@(timeAction),
                                                                                                                                                                                       @"duration_id":@(type),
                                                                                                                                                                                       @"rangetimes_attributes":@{@"range":resetArr}},
                                                                                                @"commit":@"Update Event",@"id":strNum}         success:^(AFHTTPRequestOperation *operation, id responseObject) {
           [[NSUserDefaults standardUserDefaults] setValue:responseObject[@"auth_token"] forKey:@"auth_token"];
            [[NSUserDefaults standardUserDefaults] synchronize];
                 NSLog(@"success");
                  NSLog(@"success %@",responseObject);
                                                                                                    self.urlstring =responseObject[@"url"];
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
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    SharePageViewController *shareVC = segue.destinationViewController;
    shareVC.strurl = self.urlstring;
    NSLog(@"strurl = %@",shareVC.strurl);
}
@end
