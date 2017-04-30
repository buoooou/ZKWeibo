//
//  ZKBaseViewController.h
//  ZKWeibo
//
//  Created by 张阔 on 2017/4/30.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZKBaseViewController : UIViewController

@property (nonatomic, assign) BOOL hideNavigationBar;

#pragma mark - UI

// 左侧搜索按钮
- (void)addNavigationBarLeftSearchItem;

// 右侧"我"按钮
- (void)addNavigationBarRightMeItem;

@end
