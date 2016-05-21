//
//  LCEVideoViewController.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/18.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEVideoViewController.h"
#import "LCEVideoApi.h"
#import "LCEVideoModel.h"
#import "LCEVideoListModel.h"
#import <MJRefresh.h>
#import "LCEVideoListTableViewCell.h"
#import <UIButton+WebCache.h>


@interface LCEVideoViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) NSInteger page;

@end

@implementation LCEVideoViewController
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"视频";
    _page = 1;
    [self requestWithData:_page];
    [self addMJRefreshHeadView];
    [self addMJRefreshFootView];
    
}

#pragma mark --- TableViewDataSource;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"LCEVideoListTableViewCell";
    LCEVideoListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LCEVideoListTableViewCell" owner:self options:nil] lastObject];
    }

    LCEVideoListModel *videoListModel = self.dataArray[indexPath.row];
    
    cell.titleLabel.text = videoListModel.title;
    cell.descLabel.text = videoListModel.desc;
    cell.dateLabel.text = videoListModel.ptime;
    [cell.coverButton sd_setBackgroundImageWithURL:[NSURL URLWithString:videoListModel.cover]forState:UIControlStateNormal];
    cell.videoURL = [NSURL URLWithString:videoListModel.mp4_url];
    
    return cell;
}

#pragma mark --- TableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 271;
}

#pragma mark --- Network

- (void)requestWithData:(NSInteger)page {
    LCEVideoApi *api = [[LCEVideoApi alloc] initWithPage:page];
    if (page == 1) {
        api.needHud = YES;
    }
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        if (request.responseStatusCode == 200) {
            LCEVideoModel *model = [LCEVideoModel changeResponseJSONObject:request.responseJSONObject];
            
            if (page == 1) {
                [self.dataArray removeAllObjects];
            }
            [self.dataArray addObjectsFromArray:model.videoList];
            
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
        self.page -= 10;
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
    self.page += 10;
    [self requestWithData:self.page];
}



@end
