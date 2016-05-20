//
//  LCEPictureModel.h
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/20.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEBaseModel.h"

@class LCEPictureContentModel;

@interface LCEPictureModel : LCEBaseModel

@property (nonatomic, assign) NSInteger showapi_res_code;
@property (nullable, nonatomic, retain) NSString *showapi_res_error;
@property (nullable, nonatomic, retain) LCEPictureContentModel *showapi_res_body;

@end
