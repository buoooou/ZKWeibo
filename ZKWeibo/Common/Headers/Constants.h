//
//  Header.h
//  ZKWeibo
//
//  Created by 张阔 on 2017/4/30.
//  Copyright © 2017年 张阔. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

#define ZKHomeTitle                            @"首页"

#define BAD_NETWORK                             @"网络连接失败"
#define SERVER_ERROR                            @"服务器连接失败"

#pragma mark - UIColor
#define RGB(r,g,b)            [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define ZKAppThemeColor                        [UIColor colorWithRed:142 / 255.0 green:182 / 255.0 blue:230 / 255.0 alpha:1]// #8EB6E6
#define ZKSeparatorColor                       [UIColor colorWithWhite:229 / 255.0 alpha:1]// #E5E5E5
#define ZKNavigationBarTitleTextColor          [UIColor colorWithRed:78 / 255.0 green:92 / 255.0 blue:108 / 255.0 alpha:1]// #4E5C6C
#define ZKViewControllerBGColor                [UIColor colorWithRed:250 / 255.0 green:252 / 255.0 blue:255 / 255.0 alpha:1]// #FAFCFF

#define ZKLightGrayTextColor                   [UIColor colorWithWhite:198 / 255.0 alpha:1]// #C6C6C6
#define ZKShadowColor                          [UIColor colorWithWhite:102 / 255.0 alpha:1]// #666666

#define ZKGrayTextColor                        [UIColor colorWithWhite:177 / 255.0 alpha:1]// #B1B1B1
#define ZKDarkGrayTextColor                    [UIColor colorWithWhite:173 / 255.0 alpha:1]// #ADADAD
#define ZKLightBlackTextColor                  [UIColor colorWithWhite:90 / 255.0 alpha:1]// #5A5A5A

// HUD
#define HUD_DELAY                               1.5
#define ZKPullToRefreshBorderWidth             4
#define ZKLineSpacing							8

#define ZKCacheFilesFolderName                 @"CacheFiles"
// 热门微博列表
#define ZKPublicWeiboCount                     @"20"
#define ZKCachePublicWeiboItemFileName         @"ZKCachePublicWeiboItemFileName"
#define ZKCachePublicWeiboItemFilePath                [NSString stringWithFormat:@"%@/%@/%@", DocumentsDirectory, ZKCacheFilesFolderName, ZKCachePublicWeiboItemFileName]

#pragma mark - NSUserDefault

#define ZKLastShowIntroduceVersionAndBuild     @"ZKLastShowIntroduceVersionAndBuild"

#define ZKWeiboAccessToken                     @"ZKWeiboAccessToken"
#define ZKWeiboAccessTokenExpiresTime          @"ZKWeiboAccessTokenExpiresTime"
#define ZKWeiboAccessTokenExpiresDate          @"ZKWeiboAccessTokenExpiresDate"

#endif /* Header_h */
