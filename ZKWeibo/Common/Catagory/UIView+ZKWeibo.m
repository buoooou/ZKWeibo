//
//  UIView+MyOne.m
//  MyOne3
//
//  Created by meilbn on 9/9/16.
//  Copyright © 2016 meilbn. All rights reserved.
//

#import "UIView+ZKWeibo.h"

@implementation UIView (ZKWeibo)

/**
 *  展示图片
 *
 *  @param image         要展示的图片
 *  @param referenceRect 尺寸大小
 *  @param referenceView 父视图
 */
- (void)blowUpImage:(UIImage *)image referenceRect:(CGRect)referenceRect referenceView:(UIView *)referenceView {
	// Create image info
	JTSImageInfo *imageInfo = [[JTSImageInfo alloc] init];
	imageInfo.image = image;
	imageInfo.referenceRect = referenceRect;
	imageInfo.referenceView = referenceView;
	
	// Setup view controller
	JTSImageViewController *imageViewer = [[JTSImageViewController alloc] initWithImageInfo:imageInfo mode:JTSImageViewControllerMode_Image backgroundStyle:JTSImageViewControllerBackgroundOption_Blurred];
	
	// Present the view controller.
	[imageViewer showFromViewController:kKeyWindow.rootViewController transition:JTSImageViewControllerTransition_FromOriginalPosition];
}

@end
