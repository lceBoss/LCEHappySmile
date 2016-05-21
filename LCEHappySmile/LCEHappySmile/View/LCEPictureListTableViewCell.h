//
//  LCEPictureListTableViewCell.h
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/20.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCEPictureListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *jokeImageView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineHeightConstraint;

@end
