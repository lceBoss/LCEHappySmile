//
//  LCESoundListModel.h
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/23.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEBaseModel.h"

@interface LCESoundListModel : LCEBaseModel

//@property (nonatomic, assign) NSInteger trackId;
//@property (nonatomic, assign) NSInteger uid;
@property (nullable, nonatomic, copy) NSString *playUrl64;
@property (nullable, nonatomic, copy) NSString *playUrl32;
//@property (nullable, nonatomic, copy) NSString *playPathHq;
//@property (nullable, nonatomic, copy) NSString *playPathAacv164;
//@property (nullable, nonatomic, copy) NSString *playPathAacv224;
@property (nullable, nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger duration;
//@property (nonatomic, assign) NSInteger albumId;
//@property (nonatomic, assign) BOOL isPaid;
//@property (nonatomic, assign) NSInteger processState;
//@property (nonatomic, assign) NSInteger createdAt;
@property (nullable, nonatomic, copy) NSString *coverSmall;
@property (nullable, nonatomic, copy) NSString *coverMiddle;
@property (nullable, nonatomic, copy) NSString *coverLarge;
//@property (nullable, nonatomic, copy) NSString *nickname;
//@property (nullable, nonatomic, copy) NSString *smallLogo;
//@property (nonatomic, assign) NSInteger userSource;
//@property (nonatomic, assign) NSInteger opType;
//@property (nonatomic, assign) BOOL isPublic;
//@property (nonatomic, assign) NSInteger likes;
//@property (nonatomic, assign) NSInteger playtimes;
//@property (nonatomic, assign) NSInteger comments;
//@property (nonatomic, assign) NSInteger shares;
//@property (nonatomic, assign) NSInteger status;

@end
