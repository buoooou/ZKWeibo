//
//  ZKHomeItem.m
//  ZKWeibo
//
//  Created by 张阔 on 2017/5/1.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import "ZKPublicWeiboItem.h"

@implementation ZKPublicWeiboItem
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"created_time" : @"created_at",
             @"content" : @"text",
             @"source" : @"source",
             @"picture" : @"original_pic",};

}
@end
