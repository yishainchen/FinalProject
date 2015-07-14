//
//  DateActionViewController.m
//  FlashDating
//
//  Created by yishain on 7/13/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "DateActionViewController.h"

@interface DateActionViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btnAction1;

@property (weak, nonatomic) IBOutlet UIButton *btnAction2;

@property (weak, nonatomic) IBOutlet UIButton *btnAction3;

@end

@implementation DateActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnAction1.layer.cornerRadius = 50;
     self.btnAction2.layer.cornerRadius = 50;
     self.btnAction3.layer.cornerRadius = 50;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnSelected:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
- (IBAction)btnSelected2:(UIButton *)sender {
    sender.selected = !sender.selected;
}
- (IBAction)btnSelected3:(UIButton *)sender {
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
