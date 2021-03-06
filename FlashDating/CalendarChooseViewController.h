//
//  CalendarChooseViewController.h
//  FlashDating
//
//  Created by yishain on 7/14/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "DateTypeViewController.h"
#import "EricTableViewCell.h"

@interface CalendarChooseViewController : UIViewController {
    FBSDKAccessToken *myToken;
    
}

@property NSNumber* identifynum;
@property (strong, nonatomic) UILabel *labelA;
@property (strong, nonatomic) UILabel *labelTime;
@property (retain ,nonatomic) NSString *str1;
@property (retain ,nonatomic) NSString *str2;
@property (retain ,nonatomic) NSString *strBegin;
@property (retain ,nonatomic) NSString *strEnd;
@property NSMutableArray *arr2;
@property NSString *urlstring;

@property (weak, nonatomic) IBOutlet UILabel *labelChoose;
@property  int num;

@end
