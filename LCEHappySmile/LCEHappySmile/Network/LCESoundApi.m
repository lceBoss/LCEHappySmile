//
//  LCESoundApi.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/23.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCESoundApi.h"

@implementation LCESoundApi {
    NSInteger _page;
}

- (instancetype)initWithPage:(NSInteger)page {
    if (self = [super init]) {
        _page = page;
    }
    return self;
}

- (NSString *)requestUrl {
    return [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/others/ca/album/track/4004812/true/%ld/20?device=iPhone", (long)_page];
}

@end
