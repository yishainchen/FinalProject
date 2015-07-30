//
//  CalendarViewController.h
//  FlashDating
//
//  Created by yishain on 7/10/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CalendarViewController : UIViewController
{
  FBSDKAccessToken *myToken;

}
@property (weak, nonatomic) IBOutlet UIButton *Backbtn;

@property (weak, nonatomic) IBOutlet UILabel *desLable;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UILabel *lblSelectedDate;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerControl;
@property (weak, nonatomic) IBOutlet UILabel *lblSelectedDateEnd;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerControlEnd;
@property int i;
@property NSString* strTime;
@property NSNumber* idNum;

@end
