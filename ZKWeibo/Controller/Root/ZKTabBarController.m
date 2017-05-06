//
//  ZKTabBarController.m
//  ZKWeibo
//
//  Created by 张阔 on 2017/4/30.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import "ZKTabBarController.h"
#import "ZKPublicWeiboViewController.h"

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
        ZKPublicWeiboViewController *publicWeiboViewController = [[ZKPublicWeiboViewController alloc] init];
        UINavigationController *publicWeiboNavigationController = [[UINavigationController alloc] initWithRootViewController:publicWeiboViewController];
        publicWeiboNavigationController.title = ZKHomeTitle;
        
        [self setViewControllers:@[publicWeiboNavigationController]];
        
        [self setupTabBar];
        
        [self createCacheFilesFolder];
        
       
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
