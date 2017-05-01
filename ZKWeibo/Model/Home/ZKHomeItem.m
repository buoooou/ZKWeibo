//
//  ZKHomeItem.m
//  ZKWeibo
//
//  Created by 张阔 on 2017/5/1.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import "ZKHomeItem.h"

@implementation ZKHomeItem
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"contentId" : @"hpcontent_id",
             @"content" : @"hp_content",
             @"title" : @"hp_title",
             @"imageURL" : @"hp_img_url",
             @"imageOriginalURL" : @"hp_img_original_url",
             @"authorId" : @"author_id",
             @"authorName" : @"hp_author",
             @"iPadURL" : @"ipad_url",
             @"makeTime" : @"hp_makettime",
             @"lastUpdateDate" : @"last_update_date",
             @"webURL" : @"web_url",
             @"wbImageURL" : @"wb_img_url",
             @"praiseNum" : @"praisenum",
             @"shareNum" : @"sharenum",
             @"commentNum" : @"commentnum"};
}
@end
