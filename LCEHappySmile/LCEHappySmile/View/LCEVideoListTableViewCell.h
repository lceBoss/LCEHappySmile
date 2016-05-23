//
//  LCEVideoListTableViewCell.h
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/21.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCEVideoListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIButton *coverButton;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (nonatomic, strong) NSURL *videoURL;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineConstraintHeight;

@end
