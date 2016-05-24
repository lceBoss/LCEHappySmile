//
//  LCETextApi.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/21.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCETextApi.h"

@implementation LCETextApi{
    
    NSInteger _page;
    
}

- (instancetype)initWithPage:(NSInteger)page {
    if (self = [super init]) {
        _page = page;
    }
    return self;
}

- (NSString *)requestUrl {
    return [NSString stringWithFormat:@"http://apis.baidu.com/showapi_open_bus/showapi_joke/joke_text?page=%ld", _page];
}

- (NSDictionary *)requestHeaderFieldValueDictionary {
    
    return @{@"apikey":@"3135084d5d1b17bf50d1e9d1ce8089f4"};
    
}



@end
