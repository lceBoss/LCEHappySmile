//
//  LCEVideoModel.h
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/21.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEBaseModel.h"
@class LCEVideoSidListModel;
@class LCEVideoListModel;

@interface LCEVideoModel : LCEBaseModel

@property (nullable, nonatomic, retain) NSString *videoHomeSid;

@property (nullable, nonatomic, retain) NSArray <LCEVideoSidListModel *> *videoSidList;

@property (nullable, nonatomic, retain) NSArray <LCEVideoListModel *>*videoList;

@end
