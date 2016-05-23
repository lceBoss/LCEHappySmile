//
//  LCESoundContentModel.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/23.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCESoundContentModel.h"
#import "LCESoundListModel.h"

@implementation LCESoundContentModel

+ (NSValueTransformer *)listJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:LCESoundListModel.class];
}

+ (NSDictionary *)relationshipModelClassesByPropertyKey {
    return @{
             @"list" : [LCESoundListModel class]
             };
}

@end
