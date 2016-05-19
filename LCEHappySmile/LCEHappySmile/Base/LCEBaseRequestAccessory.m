//
//  LCEBaseRequestAccessory.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/19.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEBaseRequestAccessory.h"
#import "LCEBaseRequest.h"
#import <LCProgressHUD.h>
#import "AppDelegate.h"
#import "NSString+Empty.h"

@implementation LCEBaseRequestAccessory

- (void)requestWillStart:(id)request {
    LCEBaseRequest *baseRequest = (LCEBaseRequest *)request;
    if (baseRequest.needHud || ![baseRequest.hudString isEmpty]) {
        NSString *hudString = [baseRequest.hudString isEmpty] ? @"玩命加载中...": baseRequest.hudString;
        [LCProgressHUD showLoading:hudString];
    }
}

- (void)requestWillStop:(id)request {
    
}

- (void)requestDidStop:(id)request {
    LCEBaseRequest *baseRequest = (LCEBaseRequest *)request;
    if (baseRequest.needHud || ![baseRequest.hudString isEmpty]) {
        if (baseRequest.requestOperation.error || baseRequest.responseStatusCode != 200) {
            if ([AFNetworkReachabilityManager sharedManager].reachable) {
                LCE_PerformOnMainThread(^{
                    [LCProgressHUD showFailure:@"请求失败"];
                });
            }else {
                LCE_PerformOnMainThread(^{
                    [LCProgressHUD showFailure:@"网络状态差请稍后重试"];
                });
            }
        }else {
            LCE_PerformOnMainThread(^{
                if (baseRequest.getRequestStatuCode == 0) {
                    [LCProgressHUD hide];
                }else {
                    [LCProgressHUD showFailure:baseRequest.errMessage ? : @"出错啦!"];
                }
            });
        }
     }
}

@end
