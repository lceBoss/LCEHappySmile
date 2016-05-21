//
//  LCEVideoModel.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/21.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEVideoModel.h"
#import "LCEVideoSidListModel.h"
#import "LCEVideoListModel.h"

@implementation LCEVideoModel

+ (NSValueTransformer *)videoSidListJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:LCEVideoSidListModel.class];
}


+ (NSValueTransformer *)videoListJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:LCEVideoListModel.class];
}

+(NSDictionary *)relationshipModelClassesByPropertyKey {
    return @{@"videoSidList" : [LCEVideoSidListModel class],
             @"videoList"  : [LCEVideoListModel class]
             };
}

@end
