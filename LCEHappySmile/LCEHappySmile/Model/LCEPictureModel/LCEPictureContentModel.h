//
//  LCEPictureContentModel.h
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/20.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEBaseModel.h"

@ class LCEPictureListModel;

@interface LCEPictureContentModel : LCEBaseModel

@property (nonatomic, assign) NSInteger allNum;
@property (nonatomic, assign) NSInteger allPages;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) NSInteger maxResult;
@property (nonatomic, assign) NSInteger ret_code;
@property (nullable, nonatomic, retain) NSArray <LCEPictureListModel *> *contentlist;

@end

/*

 allNum = 31400;
 allPages = 1570;
 contentlist =         (
                        {
                    ct = "2016-05-20 14:00:16.961";
                    id = 573ea7f06e36d3e2e28d8495;
                    img = "http://img4.hao123.com/data/3_7d9505532d106551f28336b1f2805fed_430";
                     title = "\U4e00\U76d2\U9738\U6c14\U53c8\U4e0d\U60c5\U613f\U7684\U62bd\U7eb8\U76d2";
                     type = 2;
                     },
                     {
                     ct = "2016-05-20 14:00:16.961";
                     id = 573ea7f06e36d3e2e28d8494;
                     img = "http://img0.hao123.com/data/3_c74f3db1cd66576e9d5b5bac5d609cc5_0";
                     title = "\U8fd9\U62d6\U978b\U5473\U9053\U68d2\U68d2\U54d2";
                     type = 2;
                   );
                   currentPage = 1;
                   maxResult = 20;
                   "ret_code" = 0;
         };

 
 
*/