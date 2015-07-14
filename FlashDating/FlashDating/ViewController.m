//
//  ViewController.m
//  FlashDating
//
//  Created by yishain on 6/30/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "ViewController.h"
#import "LineActivity.h"
#import <Parse/Parse.h>
#import "DateSearchViewController.h"
//#import "SphereMenuViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnDate1;
@property (weak, nonatomic) IBOutlet UIButton *btnDate2;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSArray *images = @[self.btnDate1, self.btnDate2];
//    SphereMenu *sphereMenu = [[SphereMenu alloc] initWithStartPoint:CGPointMake(160, 320) startImage:self.button submenuImages:images];
//    sphereMenu.delegate = self;
//    [self.view addSubview:sphereMenu];
    self.btnDate1.layer.cornerRadius = 15;
    self.btnDate2.layer.cornerRadius = 15;
  
//  
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    testObject[@"foo"] = @"bar";
//    [testObject saveInBackground];
//    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






- (IBAction)dateSearch:(id)sender {
   DateSearchViewController *dateVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DateSearch"];
    [self presentViewController:dateVC animated:YES completion:nil];
    
    [PFCloud callFunctionInBackground:@"hello" withParameters:[NSDictionary new] block:^(id object,NSError *error) {
        if (!error) {
            NSLog(@"great");
        }
    }];
}





@end
