//
//  ZKHomeViewController.m
//  ZKWeibo
//
//  Created by 张阔 on 2017/5/1.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import "ZKHomeViewController.h"
#import "ZKHomeView.h"
#import "ZKHTTPRequester.h"
#import "ZKHomeItem.h"

@interface ZKHomeViewController ()<GMCPagingScrollViewDataSource,GMCPagingScrollViewDelegate>{
    AAPullToRefresh *pullToRefreshLeft;
    AAPullToRefresh *pullToRefreshRight;
}
@property (strong, nonatomic) GMCPagingScrollView *pagingScrollView;
@property (strong, nonatomic) UIButton *diaryButton;
@property (strong, nonatomic) UIButton *likeButton;
@property (strong, nonatomic) UILabel *likeNumLabel;

@property (strong, nonatomic) NSArray *dataSource;
@end

@implementation ZKHomeViewController

#pragma view lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=ZKHomeTitle;
    [self addNavigationBarRightMeItem];
    [self addNavigationBarLeftSearchItem];
    
    [self initDatas];
    [self setupViews];
    [self loadCache];
    [self requestHomeMore];
}

#pragma lifecycle
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.hidesBottomBarWhenPushed = NO;
    }
    
    return self;
}

- (void)dealloc {
    pullToRefreshLeft.showPullToRefresh = NO;
    pullToRefreshRight.showPullToRefresh = NO;
}

#pragma mark - Private Method
-(void) initDatas{

}

-(void) setupViews{
    __weak typeof(self) weakSelf = self;
    _pagingScrollView = ({
        GMCPagingScrollView *pagingScrollView = [GMCPagingScrollView new];
        pagingScrollView.backgroundColor = ZKViewControllerBGColor;
        [pagingScrollView registerClass:[ZKHomeView class] forReuseIdentifier:kZKHomeViewID];
        pagingScrollView.dataSource = self;
        pagingScrollView.delegate = self;
        pagingScrollView.pageInsets = UIEdgeInsetsZero;
        pagingScrollView.interpageSpacing = 0;
        pullToRefreshLeft = [pagingScrollView.scrollView addPullToRefreshPosition:AAPullToRefreshPositionLeft actionHandler:^(AAPullToRefresh *v) {
            [weakSelf refreshHomeMore];
            [v performSelector:@selector(stopIndicatorAnimation) withObject:nil afterDelay:1];
        }];
        pullToRefreshLeft.threshold = 100;
        pullToRefreshLeft.borderColor = ZKAppThemeColor;
        pullToRefreshLeft.borderWidth = ZKPullToRefreshBorderWidth;
        pullToRefreshLeft.imageIcon = [UIImage new];
        
        pullToRefreshRight = [pagingScrollView.scrollView addPullToRefreshPosition:AAPullToRefreshPositionRight actionHandler:^(AAPullToRefresh *v) {
            [weakSelf showPreviousList];
            [v performSelector:@selector(stopIndicatorAnimation) withObject:nil afterDelay:1];
        }];
        pullToRefreshRight.borderColor = ZKAppThemeColor;
        pullToRefreshRight.borderWidth = ZKPullToRefreshBorderWidth;
        pullToRefreshRight.imageIcon = [UIImage new];
        
        [self.view addSubview:pagingScrollView];
        [pagingScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        pagingScrollView.hidden = YES;
        
        pagingScrollView;
    });

}

- (void)loadCache {
    id cacheItems = [NSKeyedUnarchiver unarchiveObjectWithFile:ZKCacheHomeItemFilePath];
    if (cacheItems) {
        self.dataSource = cacheItems;
    }
}
#pragma mark - Private Method

- (ZKHomeItem *)homeItemAtIndex:(NSInteger)index {
    return _dataSource[index];
}

- (void)updateLikeNumLabelTextWithItemIndex:(NSInteger)index {
    _likeNumLabel.text = [@([self homeItemAtIndex:index].praiseNum) stringValue];
}
#pragma mark - Setter

- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
    _pagingScrollView.hidden = NO;
    [_pagingScrollView reloadData];
    // 防止加载出来前用户滑动而跳转到了最后一个
    [_pagingScrollView setCurrentPageIndex:0];
    if (dataSource.count > 0) {
        [self updateLikeNumLabelTextWithItemIndex:0];
    }
}

#pragma mark - Action

- (void)refreshHomeMore {
    // 很奇怪，不写这行代码的话，_pagingScrollView 里面的 scrollview 的 contentOffset.x 会变成和释放刷新时 contentOffset.x 的绝对值差不多，导致第一个 item 看起来像是左移了，论脑洞的重要性
    [_pagingScrollView setCurrentPageIndex:0 reloadData:NO];
    // 刷新
    [self requestHomeMore];
}

- (void)showPreviousList {
    // 原因同上
    [_pagingScrollView setCurrentPageIndex:(_dataSource.count - 1) reloadData:NO];
  
}

#pragma mark - Network Request

- (void)requestHomeMore {
    __weak typeof(self) weakSelf = self;
//    weakSelf.dataSource=@[@"sd",@"sd"];
//    [ZKHTTPRequester requestHomeMoreWithSuccess:^(id responseObject) {
//        __strong typeof(weakSelf) strongSelf = weakSelf;
//        if (!strongSelf) {
//            return;
//        }
//        
//        if ([responseObject[@"res"] integerValue] == 0) {
//            NSError *error;
//            NSArray *items = [MTLJSONAdapter modelsOfClass:[MLBHomeItem class] fromJSONArray:responseObject[@"data"] error:&error];
//            if (!error) {
//                strongSelf.dataSource = items;
//                
//                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//                    [NSKeyedArchiver archiveRootObject:strongSelf.dataSource toFile:MLBCacheHomeItemFilePath];
//                });
//            } else {
//                [strongSelf.view showHUDModelTransformFailedWithError:error];
//            }
//        } else {
//            [strongSelf.view showHUDErrorWithText:responseObject[@"msg"]];
//        }
//    } fail:^(NSError *error) {
//        __strong typeof(weakSelf) strongSelf = weakSelf;
//        if (!strongSelf) {
//            return;
//        }
//        
//        [strongSelf.view showHUDServerError];
//    }];
}
#pragma mark - GMCPagingScrollViewDataSource

- (NSUInteger)numberOfPagesInPagingScrollView:(GMCPagingScrollView *)pagingScrollView {
    return _dataSource.count;
}

- (UIView *)pagingScrollView:(GMCPagingScrollView *)pagingScrollView pageForIndex:(NSUInteger)index {
    ZKHomeView *view = [pagingScrollView dequeueReusablePageWithIdentifier:kZKHomeViewID];
    [view configureViewWithHomeItem:[self homeItemAtIndex:index] atIndex:index inViewController:self];
    
    return view;
}

#pragma mark - GMCPagingScrollViewDelegate

- (void)pagingScrollViewDidScroll:(GMCPagingScrollView *)pagingScrollView {
    if (_pagingScrollView.isDragging) {
        CGPoint contentOffset = pagingScrollView.scrollView.contentOffset;
        pagingScrollView.scrollView.contentOffset = CGPointMake(contentOffset.x, 0);
    }
}

- (void)pagingScrollView:(GMCPagingScrollView *)pagingScrollView didScrollToPageAtIndex:(NSUInteger)index {
    [self updateLikeNumLabelTextWithItemIndex:index];
}

@end
