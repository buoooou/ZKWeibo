//
//  ZKUtilities.m
//  ZKWeibo
//
//  Created by 张阔 on 2017/4/30.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import "ZKUtilities.h"

@implementation ZKUtilities

+ (NSString *)appCurrentVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)appCurrentBuild {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
}

@end
