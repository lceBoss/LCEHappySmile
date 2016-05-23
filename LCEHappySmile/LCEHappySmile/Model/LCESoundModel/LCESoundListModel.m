//
//  LCESoundListModel.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/23.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCESoundListModel.h"

@implementation LCESoundListModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"playUrl64" : @"playUrl64",
             @"playUrl32" : @"playUrl32",
             @"title" : @"title",
             @"duration" : @"duration",
             @"coverSmall" : @"coverSmall",
             @"coverMiddle" : @"coverMiddle",
             @"coverLarge" : @"coverLarge",
            };
}

@end
