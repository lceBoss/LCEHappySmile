//
//  LCEVideoTopicModel.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/21.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEVideoTopicModel.h"

@implementation LCEVideoTopicModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"alias" : @"alias",
             @"tname" : @"tname",
             @"ename" : @"ename",
             @"tid" : @"tid"
             };
}

@end
