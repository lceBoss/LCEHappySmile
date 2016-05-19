//
//  LCEBaseRequest.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/19.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEBaseRequest.h"
#import "LCEBaseRequestAccessory.h"

@interface LCEBaseRequest ()

@property (nonatomic, strong) LCEBaseRequestAccessory *accessory;

@end

@implementation LCEBaseRequest

- (instancetype)init {
    if (self = [super init]) {
        [self addAccessory:self.accessory];
    }
    return self;
}

- (NSInteger)getRequestStatuCode {
    NSDictionary *jsonDic = self.responseJSONObject;
    return [[jsonDic objectForKey:@"ret"] integerValue];
}

- (NSString *)errMessage {
    NSDictionary *jsonDic = self.responseJSONObject;
    return [jsonDic objectForKey:@"msg"];
}

- (NSTimeInterval)requestTimeoutInterval {
    return 30;
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (YTKRequestSerializerType)requestSerializerType {
    return YTKRequestSerializerTypeJSON;
}

- (NSMutableDictionary *)baseMuDic {
    if (!_baseMuDic) {
//        _baseMuDic = [NSMutableDictionary dictionaryWithObject:[NSString stringWithFormat:@"%@",LCE_APP_VERSION] forKey:@"ver_num"];
    }
    return _baseMuDic;
}

- (id)requestArgument {
    return self.baseMuDic;
}

#pragma mark - Getter&&Setter 

- (LCEBaseRequestAccessory *)accessory {
    if (!_accessory) {
        _accessory = [[LCEBaseRequestAccessory alloc] init];
    }
    return _accessory;
}

- (NSString *)hudString {
    return _hudString ? _hudString : @"";
}



@end
