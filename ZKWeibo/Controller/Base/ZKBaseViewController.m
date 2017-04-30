//
//  ZKBaseViewController.m
//  ZKWeibo
//
//  Created by 张阔 on 2017/4/30.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import "ZKBaseViewController.h"

@interface ZKBaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation ZKBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor redColor];
    
}


#pragma mark - Lifecycle
-(void)dealloc{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
