//
//  UIImage+Original.h
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/19.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Original)

//instancetype默认会识别当前是哪个累或者对象调用,就会转换成对应的类的对象
+ (instancetype)imageWithOriginaName:(NSString *)imageName;


@end
