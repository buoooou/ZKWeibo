//
//  ZKTabBarController.m
//  ZKWeibo
//
//  Created by 张阔 on 2017/4/30.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import "ZKTabBarController.h"
#import "ZKHomeViewController.h"
#import "ZKHTTPRequester.h"

@interface ZKTabBarController ()

@end

@implementation ZKTabBarController

#pragma view lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma lifecycle
- (instancetype)init {
    self = [super init];
    
    if (self) {
        ZKHomeViewController *homeViewController = [[ZKHomeViewController alloc] init];
        UINavigationController *homeNavigationController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
        homeNavigationController.title = ZKHomeTitle;
        
        [self setViewControllers:@[homeNavigationController]];
        
        [self setupTabBar];
        
        [self createCacheFilesFolder];
        
        [self createWeiboAuthToken];
    }
    return self;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma private method

- (void)setupTabBar {
    NSArray *tabBarItemImageNames = @[@"tab_home"];
    NSInteger index = 0;
    
    for (UIViewController *vc in self.viewControllers) {
        NSString *normalImageName =  [NSString stringWithFormat:@"%@_normal", [tabBarItemImageNames objectAtIndex:index]];
        NSString *selectedImageName = [NSString stringWithFormat:@"%@_selected", [tabBarItemImageNames objectAtIndex:index]];
        UIImage *normalImage = [UIImage imageNamed:normalImageName];
        UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
        
        vc.tabBarItem.image = normalImage;
        vc.tabBarItem.selectedImage = selectedImage;
        
        index++;
    }
}
-(void)createWeiboAuthToken{

    NSDictionary *parameters = @{@"client_id": @"2076399685",@"client_secret":@"aeeb5c02b28b79f612704b4bd1dbd2fe" ,@"redirect_uri": @"https://api.weibo.com/oauth2/default.html"};
    
    [ZKHTTPRequester requestAuthTokenWithParam:parameters Success:^(id responseObject) {
        DDLogDebug(@"测试授权 %@ ",responseObject);
    } fail:^(NSError *error) {
        DDLogDebug(@" 授权错误%@ ",error);

    }];

}
- (void)createCacheFilesFolder {
    NSString *cacheFilesFolderPath = [NSString stringWithFormat:@"%@/%@", DocumentsDirectory, ZKCacheFilesFolderName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir = NO;
    BOOL isDirExist = [fileManager fileExistsAtPath:cacheFilesFolderPath isDirectory:&isDir];
    
    if(!(isDirExist && isDir)) {
        [fileManager createDirectoryAtPath:cacheFilesFolderPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
}
@end
