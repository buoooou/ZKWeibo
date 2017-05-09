//
//  ZKWeiboPhotoContainer.m
//  ZKWeibo
//
//  Created by 张阔 on 2017/5/8.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import "ZKWeiboPhotoContainer.h"
#import "ZKPublicWeiboItem.h"

@interface ZKWeiboPhotoContainer()
@property (nonatomic, strong) NSArray *imageViewsArray;
@end

@implementation ZKWeiboPhotoContainer
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    NSMutableArray *temp = [NSMutableArray new];
    
    for (int i = 0; i < 9; i++) {
        UIImageView *imageView = [UIImageView new];
        [self addSubview:imageView];
        imageView.userInteractionEnabled = YES;
        imageView.tag = i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)];
        [imageView addGestureRecognizer:tap];
        [temp addObject:imageView];
    }
    
    self.imageViewsArray = [temp copy];
}
- (void)setPicPathStringsArray:(NSArray *)picPathStringsArray
{
    _picPathStringsArray = picPathStringsArray;
    
    for (long i = _picPathStringsArray.count; i < self.imageViewsArray.count; i++) {
        UIImageView *imageView = [self.imageViewsArray objectAtIndex:i];
        imageView.hidden = YES;
    }
    
    if (_picPathStringsArray.count == 0) {
        CGRect frame = self.frame;
        frame.size.height = 0;
        self.frame = frame;
        return;
    }
    
    CGFloat itemW = [self itemWidthForPicPathArray:_picPathStringsArray];
    CGFloat itemH = 0;
    if (_picPathStringsArray.count == 1) {
        UIImageView *image = [UIImageView new];
        [image zk_sd_setImageWithURL:((ZKWeiboPicItem *)_picPathStringsArray.firstObject).picture
                placeholderImageName:@"home_cover_placeholder" cachePlachoderImage:NO];
        if (image.frame.size.width) {
            itemH = image.frame.size.height / image.frame.size.width * itemW;
        }
    } else {
        itemH = itemW;
    }
    long perRowItemCount = [self perRowItemCountForPicPathArray:_picPathStringsArray];
    CGFloat margin = 5;
    
    [_picPathStringsArray enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        long columnIndex = idx % perRowItemCount;
        long rowIndex = idx / perRowItemCount;
        UIImageView *imageView = [_imageViewsArray objectAtIndex:idx];
        imageView.hidden = NO;
        [imageView zk_sd_setImageWithURL:((ZKWeiboPicItem *)obj).picture
                placeholderImageName:@"home_cover_placeholder" cachePlachoderImage:NO];
        imageView.frame = CGRectMake(columnIndex * (itemW + margin), rowIndex * (itemH + margin), itemW, itemH);
    }];
    
    CGFloat w = perRowItemCount * itemW + (perRowItemCount - 1) * margin;
    int columnCount = ceilf(_picPathStringsArray.count * 1.0 / perRowItemCount);
    CGFloat h = columnCount * itemH + (columnCount - 1) * margin;
    
    CGRect frame = self.frame;
    frame.size.height = h;
    frame.size.width = w;
    self.frame = frame;
}

#pragma mark - private actions

- (void)tapImageView:(UITapGestureRecognizer *)tap
{
    UIImageView *imageView = (UIImageView *)tap.view;
    [self blowUpImage:imageView.image referenceRect:imageView.frame referenceView:imageView.superview];
}

- (CGFloat)itemWidthForPicPathArray:(NSArray *)array
{
    if (array.count == 1) {
        return 120;
    } else {
        CGFloat w = [UIScreen mainScreen].bounds.size.width > 320 ? 80 : 70;
        return w;
    }
}

- (NSInteger)perRowItemCountForPicPathArray:(NSArray *)array
{
    if (array.count < 3) {
        return array.count;
    } else if (array.count <= 4) {
        return 2;
    } else {
        return 3;
    }
}

@end
