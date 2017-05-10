//
//  ZKMacros.h
//  ZKWeibo
//
//  Created by 张阔 on 2017/4/30.
//  Copyright © 2017年 张阔. All rights reserved.
//

#ifndef ZKMacros_h
#define ZKMacros_h

#define kKeyWindow [UIApplication sharedApplication].keyWindow
// 屏幕高度
#define SCREEN_HEIGHT             [[UIScreen mainScreen] bounds].size.height

// 屏幕宽度
#define SCREEN_WIDTH              [[UIScreen mainScreen] bounds].size.width

//每张图片高度
#define PHOTO_HEIGHT              80

#pragma mark - Common

#define UserDefaults            [NSUserDefaults standardUserDefaults]

#pragma mark - Path

#define DocumentsDirectory      [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#pragma mark - 字符串

#define IsStringNotEmpty(string)        (string && ![@"" isEqualToString:string])

// 字体
#pragma mark - font
#define FontWithSize(size)              [UIFont systemFontOfSize:size]



#endif /* ZKMacros_h */
