//
//  ZKLoginViewController.m
//  ZKWeibo
//
//  Created by 张阔 on 2017/5/4.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import "ZKLoginViewController.h"
#import "ZKHTTPRequester.h"
#import "AppDelegate.h"

@interface ZKLoginViewController ()<UIWebViewDelegate>

@end

@implementation ZKLoginViewController{
    UIWebView *loginView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initDatas];
    [self setupViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void )setupViews{

    loginView =[[UIWebView alloc]initWithFrame:CGRectMake(0, 20, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    loginView.delegate = self;
    [self.view addSubview:loginView];
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&response_type=code&redirect_uri=https://api.weibo.com/oauth2/default.html",ZKWeiboClientId]];//创建URL
    NSURLRequest* request = [NSURLRequest requestWithURL:url];//创建NSURLRequest
    [loginView loadRequest:request];//加载
}
-(void)initDatas{

}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSString *req=request.URL.absoluteString;
    NSRange range = [req rangeOfString:@"code="];
    if(range.length){
        NSString *code = [req substringFromIndex:range.location + range.length];
    
        [self createWeiboAuthTokenWithCode:code];
        return NO;
    }
    return YES;
    
    
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    DDLogDebug(@"webViewDidStartLoad");
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    DDLogDebug(@"webViewDidFinishLoad");
}


-(void)createWeiboAuthTokenWithCode:(NSString *)code{
    
    NSDictionary *parameters = @{@"client_id": ZKWeiboClientId,@"client_secret":ZKWeiboClientSecret ,@"redirect_uri": @"https://api.weibo.com/oauth2/default.html",@"grant_type":@"authorization_code",@"code":code};
    
    [ZKHTTPRequester requestAccessTokenWithParam:parameters Success:^(id responseObject) {
        DDLogDebug(@" 测试授权 %@ ",responseObject);
        [(AppDelegate *)[UIApplication sharedApplication].delegate showMainTabBarControllers];
    } fail:^(NSError *error) {
        DDLogDebug(@" 授权错误 %@ ",error);
        
    }];
    
}


@end
