//
//  LCEPictureContentModel.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/20.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEPictureContentModel.h"
#import "LCEPictureListModel.h"

@implementation LCEPictureContentModel

+ (NSValueTransformer *)contentlistJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:LCEPictureListModel.class];
}

+(NSDictionary *)relationshipModelClassesByPropertyKey {
    return @{
             @"contentlist"  : [LCEPictureListModel class]
             };
}


@end
