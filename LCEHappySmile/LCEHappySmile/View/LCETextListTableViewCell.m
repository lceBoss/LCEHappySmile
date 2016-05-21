//
//  LCETextListTableViewCell.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/21.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCETextListTableViewCell.h"

@implementation LCETextListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.lineConstraintHeight.constant = 0.5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
