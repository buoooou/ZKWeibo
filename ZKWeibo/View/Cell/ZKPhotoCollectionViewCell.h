//
//  ZKPhotoCollectionViewCell.h
//  ZKWeibo
//
//  Created by 张阔 on 2017/5/10.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZKPhotoCollectionViewCell : UICollectionViewCell
@property(strong)UIImageView *personIcon;
-(void)setAvatarImage:(NSString *)urlString;
@end
