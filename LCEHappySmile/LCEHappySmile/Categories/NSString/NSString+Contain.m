//
//  NSString+Contain.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/19.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "NSString+Contain.h"

@implementation NSString (Contain)

- (BOOL)contains:(NSString*)substring {
    NSRange range = [self rangeOfString:substring];
    return range.location != NSNotFound;
}

- (BOOL)endsWith:(NSString*)substring {
    NSRange range = [self rangeOfString:substring];
    return range.location == [self length] - [substring length];
}

- (BOOL)startsWith:(NSString*)substring {
    NSRange range = [self rangeOfString:substring];
    return range.location == 0;
}


@end
