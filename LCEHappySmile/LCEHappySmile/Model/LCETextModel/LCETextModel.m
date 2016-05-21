//
//  LCETextModel.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/21.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCETextModel.h"
#import "LCETextContentModel.h"

@implementation LCETextModel

+ (NSValueTransformer *)showapi_res_bodyJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:LCETextContentModel.class];
}

+(NSDictionary *)relationshipModelClassesByPropertyKey {
    return @{
             @"showapi_res_body"  : [LCETextContentModel class]
             };
}

@end
