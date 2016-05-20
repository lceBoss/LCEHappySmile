//
//  LCEPictureModel.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/20.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEPictureModel.h"
#import "LCEPictureContentModel.h"

@implementation LCEPictureModel

+ (NSValueTransformer *)showapi_res_bodyJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:LCEPictureContentModel.class];
}

+(NSDictionary *)relationshipModelClassesByPropertyKey {
    return @{
             @"showapi_res_body"  : [LCEPictureContentModel class]
             };
}



@end
