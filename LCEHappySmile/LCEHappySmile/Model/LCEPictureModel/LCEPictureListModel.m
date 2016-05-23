//
//  LCEPictureListModel.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/20.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEPictureListModel.h"

@implementation LCEPictureListModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"ct" : @"ct",
             @"img" : @"img",
             @"pic_id" : @"id",
             @"title" : @"title",
             @"type" : @"type"};
}



@end
