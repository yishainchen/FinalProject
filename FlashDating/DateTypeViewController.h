//
//  DateTypeViewController.h
//  FlashDating
//
//  Created by yishain on 7/10/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DateTypeViewController;
@protocol DateTypedelegate <NSObject>
@required

-(void)labelText:(DateTypeViewController *)typeVC;

@end
@interface DateTypeViewController : UIViewController
@property id<DateTypedelegate>delegate;

@end
