//
//  TimeSliderViewController.m
//  FlashDating
//
//  Created by yishain on 7/19/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "TimeSliderViewController.h"
#import "CalendarViewController.h"
@interface TimeSliderViewController ()

@end

@implementation TimeSliderViewController
@synthesize dateLabel;
@synthesize sliderValueLabel;
@synthesize dateLableEnd;
@synthesize Slider;
@synthesize startDate;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    CalendarViewController *calendarVC;
    
    
    
    dateLableEnd.text = @"2010.01.01";
    sliderValueLabel.text = @"0";
    
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"dd.MM.yyyy"];
    
    self.startDate = [inputFormatter dateFromString:dateLabel.text];
    
//    NSLog(@"startDate: ", self.startDate.description);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//
//- (IBAction)slider:(UISlider *)sender {
//    Slider.value = 0;
//    Slider.maximumValue = 14;
//    int sliderValueAsInt = (int)(Slider.value + 14.0f);
//    NSString *newText = [[NSString alloc] initWithFormat:@"%d", sliderValueAsInt];
//    sliderValueLabel.text = newText;
//    NSDate *newDate = [startDate addTimeInterval:86400 * sliderValueAsInt];
//    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
//    [outputFormatter setDateFormat:@"yyyy.MM.dd"];
//
//    dateLableEnd.text = [outputFormatter stringFromDate:newDate];
//    
//}

@end
