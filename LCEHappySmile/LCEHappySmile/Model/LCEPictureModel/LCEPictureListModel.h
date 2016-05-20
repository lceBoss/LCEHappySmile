//
//  LCEPictureListModel.h
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/20.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEBaseModel.h"

@interface LCEPictureListModel : LCEBaseModel

@property (nonatomic, copy) NSString *ct;
@property (nonatomic, copy) NSString *pic_id;
@property (nonatomic, copy) NSString *img;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger type;

@end
