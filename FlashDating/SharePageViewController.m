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
@interface SharePageViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnShare;



@end

@implementation SharePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.notiTime.text = self.str1;
    self.btnShare.layer.cornerRadius = 10;
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
