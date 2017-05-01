//
//  ZKBaseView.h
//  ZKWeibo
//
//  Created by 张阔 on 2017/5/1.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKBaseViewController.h"

@interface ZKBaseView : UIView

@property (nonatomic, weak) ZKBaseViewController *parentViewController;
@property (nonatomic, assign) NSInteger viewIndex;
@end
