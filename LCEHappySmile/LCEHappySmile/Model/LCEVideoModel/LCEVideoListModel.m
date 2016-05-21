//
//  LCEVideoListModel.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/21.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEVideoListModel.h"
#import "LCEVideoTopicModel.h"

@implementation LCEVideoListModel

+ (NSValueTransformer *)videoTopicJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:LCEVideoTopicModel.class];
}

+(NSDictionary *)relationshipModelClassesByPropertyKey {
    return @{
             @"videoTopic"  : [LCEVideoTopicModel class]
             };
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"topicImg" : @"topicImg",
             @"replyCount" : @"replyCount",
             @"videosource" : @"videosource",
             @"mp4Hd_url" : @"mp4Hd_url",
             @"topicDesc" : @"topicDesc",
             @"topicSid" : @"topicSid",
             @"cover" : @"cover",
             @"title" : @"title",
             @"playCount" : @"playCount",
             @"replyBoard" : @"replyBoard",
             @"videoTopic" : @"videoTopic",
             @"sectiontitle" : @"sectiontitle",
             @"replyid" : @"replyid",
             @"desc" : @"description",
             @"mp4_url" : @"mp4_url",
             @"length" : @"length",
             @"playersize" : @"playersize",
             @"m3u8Hd_url" : @"m3u8Hd_url",
             @"vid" : @"vid",
             @"m3u8_url" : @"m3u8_url",
             @"ptime" : @"ptime",
             @"topicName" : @"topicName"
             };
}

@end
