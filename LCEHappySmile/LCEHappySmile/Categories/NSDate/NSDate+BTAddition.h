//
//  NSDate+BTAddition.h
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/19.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (BTAddition)

/**
 *  转换成描述性字符串
 */
- (NSString *)transformToFuzzyDate;

/**
 *  转换成描述性字符串
 */
- (NSString *)promptDateString;

/**
 *  转换时间戳
 *
 *  @param timestamp 时间戳
 *
 *  @return 时间对象
 */
+ (NSDate *)dateWithTimestamp:(long long)timestamp;

/**
 *  比较时间（self），获取间隔
 */
- (NSInteger)compareWithDate:(NSDate *)date;

/**
 *  比较时间（当前时间），获取间隔
 */
+ (NSInteger)compareCurrentTimeWithDate:(NSDate *)date;

/**
 *  将字符串时间转换为NSDate
 *
 *  @param dateString 字符串时间 @"yyyy-MM-dd HH:mm:ss"
 *
 *  @return NSDate
 */
+ (NSDate *)getDate:(NSString *)dateString;

/**
 *  将字符串时间转换为NSDate
 *
 *  @param dateTimeString 字符串时间 HH:mm:ss
 *
 *  @return NSDate
 */
+ (NSDate *)getDateTime:(NSString *)dateTimeString;

/**
 *  判断是否在当前日期的后7天之内
 *
 *  @param dateString 字符串时间@"yy-MM-dd HH:mm"
 *
 *  @return bool值
 */
+ (BOOL)insideOfSevenDaysWithDateString:(NSString *)dateString;

/**
 *  获取当前时间的字符串格式
 */
+ (NSString *)getTheCurrentDateString;

/**
 *  获取当前时间的字符串格式 简单格式
 */
+ (NSString *)getTheCurrentDateSimpleFormat;

/**
 *  获取时间的字符串格式
 */
+ (NSString *)getTheDateStringWithDate:(NSDate *)date;

/**
 *  获取当前时间前n个月数据格式  2015-09
 *
 *  @param month 前几个月
 *
 *  @return 数组
 */
+ (NSArray *)getMonthToCurrentOfTheMonth:(NSInteger )month;

/**
 *  获取字符串
 *
 *  @param timestamp 事件戳
 *
 *  @return 字符串
 */
+ (NSString *)stringWithTimestamp:(long long)timestamp;

/**
 *  把时间转换为 分钟和秒
 *
 *  @param times 秒
 *
 *  @return 00:11:40
 */
+ (NSString *)changeToTimeString:(int)totalSeconds;

/**
 *  获取当前时间的剩余时间
 *
 *  @param time 要比较的时间
 *
 *  @return
 */
+ (NSString *)getResidualTime:(NSString *)time;

/**
 *  把时间转换为 float时间
 *
 *  @param time 时间字符串
 *
 *  @return 时间float
 */
+ (CGFloat)changeToFloatTime:(NSString *)time;

/**
 *  把时间转换为 float分钟
 *
 *  @param time 时间字符串
 *
 *  @return 分钟float
 */
+ (CGFloat)changeToFloatMinute:(NSString *)time;

@end
