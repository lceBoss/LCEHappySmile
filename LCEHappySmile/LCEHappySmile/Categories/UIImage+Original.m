//
//  UIImage+Original.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/19.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "UIImage+Original.h"

@implementation UIImage (Original)

+ (instancetype)imageWithOriginaName:(NSString *)imageName {
    
    UIImage *setImage = [UIImage imageNamed:imageName];
    setImage = [setImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return setImage;
    
}

@end
