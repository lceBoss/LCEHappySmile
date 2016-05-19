//
//  LCEUtilExtend.h
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/19.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#ifndef LCEUtilExtend_h
#define LCEUtilExtend_h

//Alert提示
CG_INLINE void KNB_AlertlogError (NSString* message)
{
    static UIAlertView *alertView = nil;
    if (!alertView)
    {
        alertView = [[UIAlertView alloc] initWithTitle:  @""
                                               message: message
                                              delegate: nil
                                     cancelButtonTitle: @"OK"
                                     otherButtonTitles: nil,
                     nil];
        [alertView show];
    }
    else
    {
        [alertView dismissWithClickedButtonIndex:0 animated:NO];
        alertView = nil;
        alertView = [[UIAlertView alloc] initWithTitle:  @""
                                               message: message
                                              delegate: nil
                                     cancelButtonTitle: @"OK"
                                     otherButtonTitles: nil,
                     nil];
        [alertView show];
    }
}

//多线程相关
CG_INLINE void LCE_PerformAsynchronous (void(^block)(void)) {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, block);
}

CG_INLINE void LCE_PerformOnMainThread (void(^block)(void)) {
    dispatch_async(dispatch_get_main_queue(), block);
}

CG_INLINE BOOL isPhoneNumber(NSString *number){
    //* 普通
    NSString *MB=@"^(\\+86)?1[3-8]\\d{9}$";
    //* 移动
    NSString *CM=@"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    //* 联通
    NSString *CU=@"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    //* 电信
    NSString *CT=@"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    NSPredicate *regextestmb = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",MB];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CT];
    if(([regextestmb evaluateWithObject:number] ==YES) ||
       ([regextestcm evaluateWithObject:number] ==YES) ||
       ([regextestct evaluateWithObject:number] ==YES) ||
       ([regextestcu evaluateWithObject:number] ==YES)) {
        return YES;
    }
    else {
        return NO;
    }
}


#endif /* LCEUtilExtend_h */
