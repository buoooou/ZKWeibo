//
//  ZKUserItem.h
//  ZKWeibo
//
//  Created by 张阔 on 2017/5/6.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import "ZKBaseModel.h"

@interface ZKUserItem : ZKBaseModel
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *avatar_hd;
@property (nonatomic, assign) NSInteger *followers;
@property (nonatomic, assign) NSInteger *friends;
@property (nonatomic, assign) NSInteger *statuses;
@property (nonatomic, assign) NSInteger *favourites;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *createdTime;

@end
