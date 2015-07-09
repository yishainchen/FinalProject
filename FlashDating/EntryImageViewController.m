//
//  EntryImageViewController.m
//  FlashDating
//
//  Created by yishain on 7/5/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "EntryImageViewController.h"

@interface EntryImageViewController ()

@end

@implementation EntryImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    imageArray = [[NSMutableArray alloc]initWithObjects:@"Italy",@"Italy2",@"Italy3", nil];
    self.pageCtl.numberOfPages = [imageArray count];
  
    [self showImage];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) showImage {
    NSString *filename = [imageArray objectAtIndex:self.pageCtl.currentPage];
    self.myImg.image = [UIImage imageNamed:filename];

}
- (IBAction)handleSwipe:(UISwipeGestureRecognizer *)sender {
    switch (sender.direction) {
        case  UISwipeGestureRecognizerDirectionLeft:
            if (self.pageCtl.currentPage < [imageArray count]) {
                self.pageCtl.currentPage++;
                [self showImage];
                NSLog(@"left");
            }
            break;
            
        case  UISwipeGestureRecognizerDirectionRight:
            if (self.pageCtl.currentPage > 0) {
                self.pageCtl.currentPage--;
                [self showImage];
                NSLog(@"right");
                break;
            }
        default:;
    }

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
