//
//  LCEPictureCollectionViewCell.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/24.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEPictureCollectionViewCell.h"

@implementation LCEPictureCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.jokeImageView.clipsToBounds = YES;
}

@end
