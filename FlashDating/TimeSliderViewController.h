//
//  TimeSliderViewController.h
//  FlashDating
//
//  Created by yishain on 7/19/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeSliderViewController : UIViewController
{
    UILabel *dateLabel;
    UILabel *dateLableEnd;
    UILabel *sliderValueLabel;
    UISlider *Slider;
    NSDate *startDate;
}
@property (nonatomic, retain) IBOutlet UILabel *dateLabel;
@property (nonatomic, retain) IBOutlet UILabel *dateLableEnd;
@property (nonatomic, retain) IBOutlet UILabel *sliderValueLabel;
@property (nonatomic, retain) IBOutlet UISlider *Slider;
@property (nonatomic, retain) NSDate *startDate;


@end

