//
//  LCETextListModel.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/21.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCETextListModel.h"

@implementation LCETextListModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"ct" : @"ct",
             @"text" : @"text",
             @"text_id" : @"id",
             @"title" : @"title",
             @"type" : @"type"};
}

@end
