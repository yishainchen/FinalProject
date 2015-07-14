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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
