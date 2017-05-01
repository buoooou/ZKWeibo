//
//  ZKHTTPRequester.m
//  ZKWeibo
//
//  Created by 张阔 on 2017/5/1.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import "ZKHTTPRequester.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFNetworkActivityIndicatorManager.h>
#import "ZKWeiboApiConstants.h"

@implementation ZKHTTPRequester

+ (AFHTTPSessionManager *)AFHTTPSessionManager {
    static AFHTTPSessionManager *manager;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager = [[AFHTTPSessionManager alloc] init];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
    });
    
    return manager;
}

+ (NSString *)urlWithApi:(NSString *)api {
    return [NSString stringWithFormat:@"%@%@", ZKApiServerAddress, api];
}

#pragma mark - Home Page

// 首页图文列表
+ (void)requestHomeMoreWithSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock {
    [ZKHTTPRequester getWithURI:ZKApiHomePageMore success:successBlock fail:failBlock];
}



+ (void)getWithURI:(NSString *)api success:(SuccessBlock)successBlock fail:(FailBlock)failBlock {
    AFHTTPSessionManager *manager = [ZKHTTPRequester AFHTTPSessionManager];
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    [manager GET:[ZKHTTPRequester urlWithApi:api] parameters:nil progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        DDLogDebug(@"operation = %@, error = %@", task, error);
        if (failBlock) {
            failBlock(error);
        }
    }];
}
@end
