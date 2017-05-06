//
//  ZKHomeItem.h
//  ZKWeibo
//
//  Created by 张阔 on 2017/5/1.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import "ZKBaseModel.h"
#import "ZKUserItem.h"
@interface ZKPublicWeiboItem : ZKBaseModel

@property (nonatomic, strong) NSDate *created_time;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *source;

@property (nonatomic, strong) ZKUserItem *user;
@property (nonatomic, strong) NSString *picture;
@end
