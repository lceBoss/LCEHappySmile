//
//  LCETextListModel.h
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/21.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEBaseModel.h"

@interface LCETextListModel : LCEBaseModel

@property (nonatomic, copy) NSString *ct;
@property (nonatomic, copy) NSString *text_id;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger type;

@end
