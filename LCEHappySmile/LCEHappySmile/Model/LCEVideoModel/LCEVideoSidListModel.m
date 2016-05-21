//
//  LCEVideoSidListModel.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/21.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEVideoSidListModel.h"

@implementation LCEVideoSidListModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"sid" : @"sid",
        @"title" : @"title",
        @"imgsrc" : @"imgsrc"
    };
}

@end
