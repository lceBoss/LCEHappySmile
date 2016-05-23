//
//  LCESoundViewController.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/18.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCESoundViewController.h"
#import "LCESoundApi.h"
#import "LCESoundListModel.h"
#import "LCESoundModel.h"
#import "LCESoundContentModel.h"
#import "LCESoundTableViewCell.h"
#import <MJRefresh.h>
#import <UIImageView+WebCache.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface LCESoundViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation LCESoundViewController
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"声音";
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
    static NSString *identifier = @"LCESoundTableViewCell";
    LCESoundTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LCESoundTableViewCell" owner:self options:nil] lastObject];
    }
    LCESoundListModel *listModel = self.dataArray[indexPath.row];
    
    [cell.headerImageView sd_setImageWithURL:[NSURL URLWithString:listModel.coverMiddle] placeholderImage:[UIImage imageNamed:@"loading.jpg"]];
    cell.titleLabel.text = listModel.title;
    
    return cell;
}

#pragma mark --- TableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
// 不加此句时，在二级栏目点击返回时，此行会由选中状态慢慢变成非选中状态。
// 加上此句，返回时直接就是非选中状态。
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //添加后台播放模式,需要在plist文件中添加background modes
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    LCESoundListModel *listModel = self.dataArray[indexPath.row];
    AVPlayerViewController *vc=[AVPlayerViewController new];
    AVPlayer *player=[AVPlayer playerWithURL:[NSURL URLWithString:listModel.playUrl32]];
    vc.player = player;
    [self presentViewController:vc animated:YES completion:nil];
    [vc.player play];  //弹出之后 自动播放
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 93;
}

#pragma mark --- Network

- (void)requestWithData:(NSInteger)page {
    LCESoundApi *api = [[LCESoundApi alloc] initWithPage:page];
    if (page == 1) {
        api.needHud = YES;
    }
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        if (request.responseStatusCode == 200) {
            LCESoundModel *model = [LCESoundModel changeResponseJSONObject:request.responseJSONObject];
            LCESoundContentModel *contentModel = model.tracks;
            
            if (page == 1) {
                [self.dataArray removeAllObjects];
            }
            [self.dataArray addObjectsFromArray:contentModel.list];
            
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
        self.page --;
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
