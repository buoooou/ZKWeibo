//
//  UIView+MyOne.h
//  MyOne3
//
//  Created by meilbn on 9/9/16.
//  Copyright © 2016 meilbn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZKWeibo)

/**
 *  展示图片
 *
 *  @param image         要展示的图片
 *  @param referenceRect 尺寸大小
 *  @param referenceView 父视图
 */
- (void)blowUpImage:(UIImage *)image referenceRect:(CGRect)referenceRect referenceView:(UIView *)referenceView;

@end
