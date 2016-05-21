//
//  LCETextContentModel.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/21.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCETextContentModel.h"
#import "LCETextListModel.h"

@implementation LCETextContentModel

+ (NSValueTransformer *)contentlistJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:LCETextListModel.class];
}

+(NSDictionary *)relationshipModelClassesByPropertyKey {
    return @{
             @"contentlist"  : [LCETextListModel class]
             };
}


@end
