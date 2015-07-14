//
//  DateTypeViewController.m
//  FlashDating
//
//  Created by yishain on 7/10/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "DateTypeViewController.h"
#import "CMPopTipView.h"
@interface DateTypeViewController () <CMPopTipViewDelegate>
{
    }
@property id < CMPopTipViewDelegate > delegate;
@property CMPopTipView *roundRectButtonPopTipView;

@property (weak, nonatomic) IBOutlet UIButton *btnType1;

@property (weak, nonatomic) IBOutlet UIButton *btnType2;
@property (weak, nonatomic) IBOutlet UIButton *btnType3;

@end

@implementation DateTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnType1.layer.cornerRadius = 50;
    self.btnType2.layer.cornerRadius = 50;
    self.btnType3.layer.cornerRadius = 50;
    
    CMPopTipView *navBarLeftButtonPopTipView = [[CMPopTipView alloc] initWithMessage:@"A Message"];
    navBarLeftButtonPopTipView.delegate = self;
    [navBarLeftButtonPopTipView presentPointingAtBarButtonItem:self.navigationItem.leftBarButtonItem animated:YES];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnAction:(id)sender {
    if (nil == self.roundRectButtonPopTipView) {
    self.roundRectButtonPopTipView = [[CMPopTipView alloc] initWithMessage:@"選擇聚會時段"] ;
    self.roundRectButtonPopTipView.delegate = self;
    self.roundRectButtonPopTipView.backgroundColor = [UIColor lightGrayColor];
    self.roundRectButtonPopTipView.textColor = [UIColor darkTextColor];
    self.roundRectButtonPopTipView.has3DStyle = NO;
//    self.roundRectButtonPopTipView presentPointingAtView:<#(UIView *)#> inView:<#(UIView *)#> animated:<#(BOOL)#>
    UIButton *button = (UIButton *)sender;
    [self.roundRectButtonPopTipView presentPointingAtView:button inView:self.view animated:YES];
}
else {
    // Dismiss
    [self.roundRectButtonPopTipView dismissAnimated:YES];
    self.roundRectButtonPopTipView = nil;
}
}
- (IBAction)btnType1:(UIButton *)sender {
    sender.selected = !sender.selected;
}
- (IBAction)btnType2:(UIButton *)sender {
    sender.selected = !sender.selected;
}
- (IBAction)btnType3:(UIButton *)sender {
    sender.selected = !sender.selected;
}

#pragma mark CMPopTipViewDelegate methods
- (void)popTipViewWasDismissedByUser:(CMPopTipView *)popTipView {
    // User can tap CMPopTipView to dismiss it
    self.roundRectButtonPopTipView = nil;
}




/*#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
