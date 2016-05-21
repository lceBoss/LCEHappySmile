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
    [sender addSubview:[LCEVideoListTableViewCell sharedInstance].view];
    [[LCEVideoListTableViewCell sharedInstance].view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
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
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
