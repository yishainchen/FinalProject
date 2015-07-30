//
//  EricTableViewCell.m
//  FlashDating
//
//  Created by yishain on 7/20/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "EricTableViewCell.h"

@implementation EricTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.btnDate.layer.cornerRadius = 11;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
