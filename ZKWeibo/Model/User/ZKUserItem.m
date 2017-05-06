//
//  ZKUserItem.m
//  ZKWeibo
//
//  Created by 张阔 on 2017/5/6.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import "ZKUserItem.h"

@implementation ZKUserItem
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"nickname" : @"screen_name",
             @"avatar" : @"profile_image_url",
             @"followers" : @"followers_count",
             @"friends" : @"friends_count",
             @"statuses" : @"statuses_count",
             @"favourites" : @"favourites_count",
             @"gender" : @"gender",
             @"avatar_hd" : @"avatar_hd"};
    
}
@end
