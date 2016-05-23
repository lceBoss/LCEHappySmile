//
//  LCESoundModel.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/23.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCESoundModel.h"
#import "LCESoundAlbumModel.h"
#import "LCESoundContentModel.h"

@implementation LCESoundModel

+ (NSValueTransformer *)albumJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:LCESoundAlbumModel.class];
}

+ (NSValueTransformer *)tracksJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:LCESoundContentModel.class];
}


+(NSDictionary *)relationshipModelClassesByPropertyKey {
    return @{
             @"album"  : [LCESoundAlbumModel class],
             @"tracks" : [LCESoundContentModel class]
             };
}

@end
