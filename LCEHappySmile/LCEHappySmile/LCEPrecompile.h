//
//  LCEPrecompile.h
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/19.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#ifndef LCEPrecompile_h
#define LCEPrecompile_h

//单例宏定义.h
#define LCE_DEFINE_SINGLETON_FOR_HEADER(className) \
\
+ (className *)shareInstance;

//单例宏定义.m
#define LCE_DEFINE_SINGLETON_FOR_CLASS(className) \
\
+ (className *)shareInstance { \
static className *instance = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
instance = [[self alloc] init]; \
}); \
return instance; \
}

//色值宏定义
#define LCE_RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define LCE_RGB(r,g,b)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

//设备屏幕高度
#define LCE_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

//设备屏幕宽度
#define LCE_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

//导航栏的高
#define LCE_NAVI_HEIGHT 64

//App版本
#define LCE_APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//屏幕大小
#define LCE_SCREEN_BOUNDS [[UIScreen mainScreen] bounds]

//背景颜色
#define LCE_BG_COLOR [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0]

//weakSelf
#define LCE_WS(weakSelf)  __weak __typeof(self)weakSelf = self;

//strongSelf
#define LCE_SS(strongSelf, weakSelf) __strong __typeof(weakSelf)strongSelf = weakSelf;


#endif /* LCEPrecompile_h */
