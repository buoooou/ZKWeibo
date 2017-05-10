//
//  ZKWeiboPhotoContainer.h
//  ZKWeibo
//
//  Created by 张阔 on 2017/5/8.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZKWeiboPhotoContainer : UIView
@property (nonatomic, strong) NSArray *picPathStringsArray;
-(void)addPicPathStringsArray:(NSArray *)picPathStringsArray;
@end
