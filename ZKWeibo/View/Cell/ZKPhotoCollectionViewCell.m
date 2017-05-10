//
//  ZKPhotoCollectionViewCell.m
//  ZKWeibo
//
//  Created by 张阔 on 2017/5/10.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import "ZKPhotoCollectionViewCell.h"

@implementation ZKPhotoCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.personIcon = [UIImageView new];
        [self.contentView addSubview:self.personIcon];
        [self.personIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(7.5);
            make.left.mas_equalTo(7.5);
            make.size.mas_equalTo(CGSizeMake(90,90));
        }];
        [self.personIcon setClipsToBounds:YES];
        [self.personIcon.layer setCornerRadius:4];
        [self.personIcon.layer setBorderColor:RGB(229, 229, 229).CGColor];
        [self.personIcon.layer setBorderWidth:0.5];
        [self.personIcon setContentMode:UIViewContentModeScaleAspectFill];
        
    }
    return self;
}
-(void)setAvatarImage:(NSString *)urlString
{
    [self.personIcon zk_sd_setImageWithURL:urlString placeholderImageName:@"home_cover_placeholder" cachePlachoderImage:NO];
}
@end
