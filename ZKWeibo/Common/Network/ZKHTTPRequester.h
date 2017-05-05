//
//  ZKHTTPRequester.h
//  ZKWeibo
//
//  Created by 张阔 on 2017/5/1.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZKWeiboApiConstants.h"
// 成功，失败 block
typedef void(^SuccessBlock)(id responseObject);
typedef void(^FailBlock)(NSError *error);

@interface ZKHTTPRequester : NSObject
#pragma mark - Home Page

// 首页图文列表
+ (void)requestHomeMoreWithSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock ;
//+(void)requestAuthorizeWithParam:(id)para Success:(SuccessBlock)successBlock fail:(FailBlock)failBlock ;
+(void)requestAccessTokenWithParam:(id)para Success:(SuccessBlock)successBlock fail:(FailBlock)failBlock ;

@end
