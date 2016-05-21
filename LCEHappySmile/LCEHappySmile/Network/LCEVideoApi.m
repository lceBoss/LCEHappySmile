//
//  LCEVideoApi.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/21.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEVideoApi.h"

@implementation LCEVideoApi {
    
    NSInteger _page;
}

- (instancetype)initWithPage:(NSInteger)page {
    if (self = [super init]) {
        _page = page;
    }
    return self;
}

- (NSString *)requestUrl {
    return [NSString stringWithFormat:@"http://c.m.163.com/nc/video/home/%ld-10.html", _page];
}



@end
