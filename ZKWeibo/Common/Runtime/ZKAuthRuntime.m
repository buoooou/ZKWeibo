//
//  ZKAuthRuntime.m
//  ZKWeibo
//
//  Created by 张阔 on 2017/5/5.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import "ZKAuthRuntime.h"

@implementation ZKAuthRuntime

+(BOOL)isAuthCodeOutOfTime{

    NSDate * expires_date=[UserDefaults objectForKey:ZKWeiboAccessTokenExpiresDate];
    if(expires_date){
        if ([[NSDate date] compare:expires_date] != NSOrderedAscending) { // 过期
            return YES;
        }
        return NO;
    }
   
    return YES;
}

@end
