//
//  LCETextViewController.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/18.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCETextViewController.h"
#import "LCETextApi.h"
#import <MJRefresh.h>
#import "LCETextModel.h"
#import "LCETextContentModel.h"
#import "LCETextListModel.h"
#import "LCETextListTableViewCell.h"

@interface LCETextViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, assign) NSInteger page;

@end

@implementation LCETextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"文字";
    _page = 1;
    [self requestWithData:_page];
    [self addMJRefreshHeadView];
    [self addMJRefreshFootView];
    
}

#pragma mark --- TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"LCETextListTableViewCell";
    LCETextListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LCETextListTableViewCell" owner:self options:nil] lastObject];
    }
    LCETextListModel *model = self.dataArray[indexPath.row];
    
    cell.titleLabel.text = model.title;
    cell.dateLabel.text = model.ct;
    cell.textContentLabel.text = model.text;
    
    return cell;
    
}

#pragma mark --- TableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 121;
}

#pragma mark --- Network

- (void)requestWithData:(NSInteger)page {
    LCETextApi *api = [[LCETextApi alloc] initWithPage:page];
    if (page == 1) {
        api.needHud = YES;
    }
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        if (request.responseStatusCode == 200) {
            LCETextModel *model = [LCETextModel changeResponseJSONObject:request.responseJSONObject];
            LCETextContentModel *contentModel = model.showapi_res_body;
            
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

#pragma mark ---- Setter && Getter

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}



@end
