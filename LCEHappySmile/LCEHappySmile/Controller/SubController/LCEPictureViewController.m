//
//  LCEPictureViewController.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/18.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEPictureViewController.h"
#import "LCEPictureCollectionViewCell.h"
#import "LCEPictureListModel.h"
#import <UIImageView+WebCache.h>
#import <UIImage+GIF.h>
#import <MJRefresh.h>
#import "LCEPictureApi.h"
#import "LCEPictureModel.h"
#import "LCEPictureContentModel.h"
#import "LookBigPicViewController.h"

@interface LCEPictureViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) NSInteger page;
@end

@implementation LCEPictureViewController
static NSString * const reuseIdentifier = @"LCEPictureCollectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"图片";
    _page = 1;
    [self requestWithData:_page];
    [self addMJRefreshFootView];
    [self addMJRefreshHeadView];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    // Register cell classes
    [self.collectionView registerNib:[UINib nibWithNibName:@"LCEPictureCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
}


#pragma mark --- CollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LCEPictureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    LCEPictureListModel *model = self.dataArray[indexPath.row];
//    cell.titleLabel.text = model.title;
//    cell.dateLabel.text = model.ct;
    [cell.jokeImageView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"loading.jpg"]];
    
    return cell;
}

#pragma mark --- CollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    LCEPictureListModel *model = self.dataArray[indexPath.row];
    LookBigPicViewController *picVC = [[LookBigPicViewController alloc]init];
    NSArray *bigUrlStr = @[model.img];
    [picVC initWithAllBigUrlArray:bigUrlStr andSmallUrlArray:nil andTargets:self andIndex:0];
    [picVC bigPicDescribe:@[model.title]];
    [picVC pushChildViewControllerFromCenter];
    //    [picVC pushChildViewControllerWithArray:self.dataArray];
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
    [self.collectionView.mj_header endRefreshing];
    [self.collectionView.mj_footer endRefreshing];
    if (self.page > 1 && isFailed) {
        self.page--;
    }
    else {
        [self.collectionView reloadData];
    }
}

#pragma makr - MJRefresh

- (void)addMJRefreshHeadView {
    LCE_WS(weakSelf);
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.page = 1;
        [weakSelf requestWithData:weakSelf.page];
    }];
}

- (void)addMJRefreshFootView{
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
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
