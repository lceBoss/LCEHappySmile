//
//  LCETextContentModel.h
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/21.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEBaseModel.h"

@class LCETextListModel;

@interface LCETextContentModel : LCEBaseModel

@property (nonatomic, assign) NSInteger allNum;
@property (nonatomic, assign) NSInteger allPages;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) NSInteger maxResult;
@property (nonatomic, assign) NSInteger ret_code;
@property (nullable, nonatomic, retain) NSArray <LCETextListModel *> *contentlist;


@end
