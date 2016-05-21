//
//  LCEVideoListModel.h
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/21.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEBaseModel.h"

@class LCEVideoTopicModel;

@interface LCEVideoListModel : LCEBaseModel

@property (nullable,nonatomic, copy) NSString *topicImg;
@property (nonatomic, assign) NSInteger replyCount;
@property (nullable,nonatomic, copy) NSString *videosource;
@property (nullable,nonatomic, copy) NSString *mp4Hd_url;
@property (nullable,nonatomic, copy) NSString *topicDesc;
@property (nullable,nonatomic, copy) NSString *topicSid;
@property (nullable,nonatomic, copy) NSString *cover;
@property (nullable,nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger playCount;
@property (nullable ,nonatomic, copy) NSString *replyBoard;
@property (nonatomic, nullable, retain) LCEVideoTopicModel *videoTopic;
@property (nullable, nonatomic, copy) NSString *sectiontitle;
@property (nullable, nonatomic, copy) NSString *replyid;
@property (nullable, nonatomic, copy) NSString *desc;
@property (nullable, nonatomic, copy) NSString *mp4_url;
@property (nonatomic, assign) NSInteger length;
@property (nonatomic, assign) NSInteger playersize;
@property (nullable, nonatomic, copy) NSString *m3u8Hd_url;
@property (nullable, nonatomic, copy) NSString *vid;
@property (nullable, nonatomic, copy) NSString *m3u8_url;
@property (nullable, nonatomic, copy) NSString *ptime;
@property (nullable, nonatomic, copy) NSString *topicName;

@end
