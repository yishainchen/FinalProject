//
//  CalendarChooseViewController.h
//  FlashDating
//
//  Created by yishain on 7/14/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "DateTypeViewController.h"


@interface CalendarChooseViewController : UIViewController {
    
}
@property NSInteger num;
@property (strong, nonatomic) UILabel *labelA;
@property (strong, nonatomic) UILabel *labelTime;
@property (weak ,nonatomic) NSString *str1;
@property (weak ,nonatomic) NSString *str2;
@property NSMutableArray *arr2;


@end
