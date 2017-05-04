//
//  ZKLoginViewController.m
//  ZKWeibo
//
//  Created by 张阔 on 2017/5/4.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import "ZKLoginViewController.h"
#import "ZKHTTPRequester.h"
@interface ZKLoginViewController ()

@end

@implementation ZKLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self createWeiboAuthToken];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)createWeiboAuthToken{
    
    
    
    NSURL *url=[NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=2076399685&response_type=code&redirect_uri=https://api.weibo.com/oauth2/default.html"];
    
    NSString * s=[NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:NULL];
    NSLog(@" 而是 %@ ",s);
    
    
    NSString *code=@"";
    NSDictionary *parameters = @{@"client_id": @"2076399685",@"client_secret":@"aeeb5c02b28b79f612704b4bd1dbd2fe" ,@"redirect_uri": @"https://api.weibo.com/oauth2/default.html",@"grant_type":@"authorization_code",@"code":code};
    
    [ZKHTTPRequester requestAccessTokenWithParam:parameters Success:^(id responseObject) {
        DDLogDebug(@" 测试授权 %@ ",responseObject);
    } fail:^(NSError *error) {
        DDLogDebug(@" 授权错误 %@ ",error);
        
    }];
    
}


@end
