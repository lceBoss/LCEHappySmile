//
//  LCESoundModel.h
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/23.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEBaseModel.h"

@class LCESoundAlbumModel;
@class LCESoundContentModel;

@interface LCESoundModel : LCEBaseModel

@property (nonatomic, assign) NSInteger ret;
@property (nullable, nonatomic, retain) LCESoundAlbumModel *album;
@property (nullable, nonatomic, retain) LCESoundContentModel *tracks;
@property (nullable, nonatomic, retain) NSString *msg;

@end
