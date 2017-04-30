//
//  ZKIntroduceViewController.m
//  ZKWeibo
//
//  Created by 张阔 on 2017/4/30.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import "ZKIntroduceViewController.h"
#import "ZKMacros.h"
#import "Constants.h"
#import "AppDelegate.h"
#import "ZKUtilities.h"

@interface ZKIntroduceViewController ()
@property (nonatomic,strong) UIButton *button;
@end
@implementation ZKIntroduceViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.button=[[UIButton alloc]init];
    self.button.frame=CGRectMake(50, 50, 300, 50);
    [self.button setTitle:@"打开首页" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(logInButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    self.view.backgroundColor=[UIColor redColor];
    [self.view addSubview:self.button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)logInButtonPressed{
    
    [self entry];
}

- (void)entry {
    NSString *version = [ZKUtilities appCurrentVersion];
    NSString *build = [ZKUtilities appCurrentBuild];
    NSString *versionAndBuild = [NSString stringWithFormat:@"%@_%@", version, build];
    [UserDefaults setObject:versionAndBuild forKey:ZKLastShowIntroduceVersionAndBuild];
    [(AppDelegate *)[UIApplication sharedApplication].delegate showMainTabBarControllers];
}

@end
