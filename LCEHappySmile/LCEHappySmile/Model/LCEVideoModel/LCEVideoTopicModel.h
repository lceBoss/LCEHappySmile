//
//  LCEVideoTopicModel.h
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/21.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEBaseModel.h"

@interface LCEVideoTopicModel : LCEBaseModel

@property (nullable, nonatomic, copy) NSString *alias;
@property (nullable, nonatomic, copy) NSString *tname;
@property (nullable, nonatomic, copy) NSString *ename;
@property (nullable, nonatomic, copy) NSString *tid;

@end
