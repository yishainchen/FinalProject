//
//  EntryImageViewController.h
//  FlashDating
//
//  Created by yishain on 7/5/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EntryImageViewController : UIViewController
{
    NSMutableArray *imageArray;
}

@property (weak, nonatomic) IBOutlet UIImageView *myImg;
@property (weak, nonatomic) IBOutlet UIPageControl *pageCtl;

-(void) showImage;
@end
