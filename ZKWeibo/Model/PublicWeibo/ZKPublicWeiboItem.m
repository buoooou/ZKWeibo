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
             @"user" : @"user",
             @"picture" : @"original_pic",};

}
+ (NSValueTransformer *)userJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[ZKUserItem class]];
}

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"EEE MM dd HH:mm:ss Z yyyy";
    //Fri Aug 28 00:00:00 +0800 2009
    return dateFormatter;
}
+ (NSValueTransformer *)created_timeJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter dateFromString:dateString];
    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter stringFromDate:date];
    }];
}
@end
