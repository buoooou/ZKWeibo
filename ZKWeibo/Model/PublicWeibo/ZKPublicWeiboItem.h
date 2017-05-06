//
//  ZKHomeItem.h
//  ZKWeibo
//
//  Created by 张阔 on 2017/5/1.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import "ZKBaseModel.h"

@interface ZKPublicWeiboItem : ZKBaseModel
@property (nonatomic, strong) NSString *contentId;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) NSString *imageOriginalURL;
@property (nonatomic, strong) NSString *authorId;
@property (nonatomic, strong) NSString *authorName;
@property (nonatomic, strong) NSString *iPadURL;
@property (nonatomic, strong) NSString *makeTime;
@property (nonatomic, strong) NSString *lastUpdateDate;
@property (nonatomic, strong) NSString *webURL;
@property (nonatomic, strong) NSString *wbImageURL;
@property (nonatomic, assign) NSInteger praiseNum;
@property (nonatomic, assign) NSInteger shareNum;
@property (nonatomic, assign) NSInteger commentNum;
@end
