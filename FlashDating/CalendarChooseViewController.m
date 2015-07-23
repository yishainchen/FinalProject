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
    NSDateFormatter *format;
    NSMutableArray *mutableArr;
    NSString *datestring;
    NSCalendar *current;
    UIButton *iv1;

}

@property (weak, nonatomic) IBOutlet UITableView *tabelView;

@end

@implementation CalendarChooseViewController

- (void)viewDidLoad {
    
    AppDelegate *delegate = [[UIApplication sharedApplication]
                             delegate];
    a = 0;
    type = 0;
    NSInteger Action;
    
    timeAction  = delegate.Action;
    NSLog(@"action = %d",timeAction);
    datestring = self.strBegin;
    mutableArr = [[NSMutableArray alloc] init];
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    NSLog(@"%d",timeAction);
    current =  [NSCalendar currentCalendar];
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
        [format setDateFormat:@"yyyy/M/d"];
    
        self.strEnd = [format stringFromDate:today];
        NSLog(@"456 = %@",self.strBegin);
        NSLog(@"123 = %@",self.strEnd);
        self.str1  = [format stringFromDate:newDate];
    
        iv1 = (UIButton *)[cell viewWithTag:1];
        iv1.tag = indexPath.row ;
        [iv1 addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    
        if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        NSLog(@"arr1 = %@", mutableArr);
        return cell;
   
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  }


-(void)buttonTapped:(UIButton *)sender {
    NSIndexPath *indexPath = [NSIndexPath
                              indexPathForRow:sender.tag
                              inSection:0];
    EricTableViewCell *cell = (EricTableViewCell *) [self.tabelView cellForRowAtIndexPath:indexPath];
    [mutableArr addObject:cell.labelDate.text];
    NSLog(@"123 = %@",mutableArr);
    

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (self.strBegin == self.strEnd)  {
        return self.num + 2;
    }
    else
        return self.num + 1;
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
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"新增聚會成功" message:@"" preferredStyle:UIAlertControllerStyleAlert];
//    [self presentViewController:alert animated:YES completion:nil];
//    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertViewStyleDefault handler:^(UIAlertAction *action) {
//        [alert dismissViewControllerAnimated:YES completion:nil];
//    }];
//    [alert addAction:cancel];

    SharePageViewController *shareVC = [self.storyboard instantiateViewControllerWithIdentifier:@"shareCell"];
    [self presentViewController:shareVC animated:YES completion:nil];
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:mutableArr
                                                       options:NSJSONWritingPrettyPrinted
                                            error:&error];
    NSString *body = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSLog(@"body = %@",body);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:@"http://catchup.today/api/v1/events" parameters:@{
                                                              @"utf8":@"✓",                                                               @"event":@{@"category_id":@"timeAction", @"duration_id":@"type",
                                                                                                                                                     @"rangetimes_attributes":@{@"range":body}},
                                                              @"commit":@"Update"}
     
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [[NSUserDefaults standardUserDefaults] setValue:responseObject[@"auth_token"] forKey:@"auth_token"];
        [[NSUserDefaults standardUserDefaults] synchronize];
              NSLog(@"success");
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

@end
