//
//  CalendarChooseViewController.m
//  FlashDating
//
//  Created by yishain on 7/14/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//


#import "CalendarViewController.h"
#import "CalendarChooseViewController.h"
@interface CalendarChooseViewController () <UITableViewDataSource,UITableViewDelegate>
{
   
}

@property (weak, nonatomic) IBOutlet UITableView *tabelView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnSend;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigator;

@end

@implementation CalendarChooseViewController

- (void)viewDidLoad {

    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    NSLog(@"num = %d",self.num);
  
  
    // Do any additional setup after loading the view.

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UILabel *label = nil;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    UILabel *labelA = [[UILabel alloc] initWithFrame:CGRectMake(20,20 , 20, 20)];
     labelA.backgroundColor = [UIColor grayColor];
    

    if (cell == nil){
   
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        label = [[UILabel alloc] initWithFrame:CGRectMake(20,20 , 20, 20)];
     
        [label setNumberOfLines:0];
        [label setTag:1];
        label.textColor = [UIColor darkGrayColor];
        [label setAlpha:0.8];
        label.backgroundColor = [UIColor grayColor];
        
        [[cell contentView] addSubview:label];
    }
    if (!label)
        label = (UILabel*)[cell viewWithTag:1];

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
- (IBAction)btnChoose2:(UIButton *)sender {
    sender.selected = !sender.selected;
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
