//
//  LCEBaseRequest.h
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/19.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "YTKRequest.h"

@interface LCEBaseRequest : YTKRequest

/**
 *  请求时是否显示HUD
 */
@property (nonatomic, assign) BOOL needHud;

/**
 *  hud显示内容
 */
@property (nonatomic, copy) NSString *hudString;

/**
 *  基本配置字典 配置 ver_num
 */
@property (nonatomic, strong) NSMutableDictionary *baseMuDic;


/**
 *  获取请求返回状态
 *
 *  @return 状态码
 */
- (NSInteger)getRequestStatuCode;

/**
 *  错误提示
 *
 *  @return 错误信息
 */
- (NSString *)errMessage;


@end
