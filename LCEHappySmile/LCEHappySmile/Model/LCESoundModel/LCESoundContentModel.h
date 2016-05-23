//
//  LCESoundContentModel.h
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/23.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEBaseModel.h"

@class LCESoundListModel;

@interface LCESoundContentModel : LCEBaseModel

@property (nullable, nonatomic, retain) NSArray <LCESoundListModel *> *list;
@property (nonatomic, assign) NSInteger pageId;
@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, assign) NSInteger maxPageId;
@property (nonatomic, assign) NSInteger totalCount;

@end
