//
//  ZKHomeView.h
//  ZKWeibo
//
//  Created by 张阔 on 2017/5/1.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import "ZKBaseView.h"

FOUNDATION_EXPORT NSString *const kZKHomeViewID;

@class ZKHomeItem;
@interface ZKHomeView : ZKBaseView

@property (nonatomic, copy) void (^clickedButton)(ZKActionType type);

- (void)configureViewWithHomeItem:(ZKHomeItem *)homeItem atIndex:(NSInteger)index;

- (void)configureViewWithHomeItem:(ZKHomeItem *)homeItem atIndex:(NSInteger)index inViewController:(ZKBaseViewController *)parentViewController;

@end
