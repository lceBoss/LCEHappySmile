//
//  LCEVideoListTableViewCell.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/21.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEVideoListTableViewCell.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@implementation LCEVideoListTableViewCell

//为了保证同一时间只有一个播放器，使用单例模式
+ (AVPlayerViewController *)sharedInstance{
    static AVPlayerViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [AVPlayerViewController new];
    });
    return vc;
}
- (IBAction)playVideo:(id)sender {
    AVPlayer *player=[AVPlayer playerWithURL:self.videoURL];
    [player play];
    [LCEVideoListTableViewCell sharedInstance].player = player;
    [LCEVideoListTableViewCell sharedInstance].view.frame = CGRectMake(0, 0, self.coverButton.frame.size.width, self.coverButton.frame.size.height);
    [sender addSubview:[LCEVideoListTableViewCell sharedInstance].view];
    
}

//如果cell被复用了，需要把cell上的播放器删掉
- (void)prepareForReuse{
    [super prepareForReuse];
    //判断当前cell是否有播放，如果有则删除-->自己想办法
    if ([LCEVideoListTableViewCell sharedInstance].view.superview == self.coverButton) {
        [[LCEVideoListTableViewCell sharedInstance].view removeFromSuperview];
        [LCEVideoListTableViewCell sharedInstance].player = nil;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.lineConstraintHeight.constant = 0.5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
