//
//  LCEPictureViewController.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/18.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEPictureViewController.h"
#import "LCEPictureListTableViewCell.h"
#import "LCEPictureListModel.h"
#import <UIImageView+WebCache.h>
#import <UIImage+GIF.h>
#import <MJRefresh.h>
#import "LCEPictureApi.h"
#import "LCEPictureModel.h"
#import "LCEPictureContentModel.h"

@interface LCEPictureViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) NSInteger page;
@end

@implementation LCEPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"图片";
    _page = 1;
    [self requestWithData:_page];
    [self addMJRefreshFootView];
    [self addMJRefreshHeadView];
    
    
}
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

#pragma mark --- TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"LCEPictureListTableViewCell";
    LCEPictureListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LCEPictureListTableViewCell" owner:self options:nil] lastObject];
    }
    LCEPictureListModel *model = self.dataArray[indexPath.row];
    
    cell.titleLabel.text = model.title;
    cell.dateLabel.text = model.ct;
    
//    NSString  *name = @"loadings.gif";
//    
//    NSString  *filePath = [[NSBundle bundleWithPath:[[NSBundle mainBundle] bundlePath]] pathForResource:name ofType:nil];
//    
//    NSData  *imageData = [NSData dataWithContentsOfFile:filePath];
//    
//    cell.jokeImageView.backgroundColor = [UIColor clearColor];
    
    [cell.jokeImageView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"loading.jpg"]];
    
    return cell;
}


#pragma mark --- TableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 93;
}

#pragma mark --- Network

- (void)requestWithData:(NSInteger)page {
    LCEPictureApi *api = [[LCEPictureApi alloc] initWithPage:page];
    if (page == 1) {
        api.needHud = YES;
    }
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        if (request.responseStatusCode == 200) {
            LCEPictureModel *model = [LCEPictureModel changeResponseJSONObject:request.responseJSONObject];
            LCEPictureContentModel *contentModel = model.showapi_res_body;
            
            if (page == 1) {
                [self.dataArray removeAllObjects];
            }
            [self.dataArray addObjectsFromArray:contentModel.contentlist];
            
            [self requestFailed:NO];
        }else {
            [self requestFailed:YES];
        }
        
    } failure:^(__kindof YTKBaseRequest *request) {
        
        [self requestFailed:YES];
        
    }];
}

- (void)requestFailed:(BOOL)isFailed {
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
    if (self.page > 1 && isFailed) {
        self.page--;
    }
    else {
        [self.tableView reloadData];
    }
}

#pragma makr - MJRefresh

- (void)addMJRefreshHeadView {
    LCE_WS(weakSelf);
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.page = 1;
        [weakSelf requestWithData:weakSelf.page];
    }];
}

- (void)addMJRefreshFootView{
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}

- (void)loadMoreData {
    [self requestWithData:++self.page];
}



@end
