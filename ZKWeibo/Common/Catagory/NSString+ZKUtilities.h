//
//  NSString+zkUtilities.h
//  meilbn
//
//  Created by meilbn on 12/1/15.
//  Copyright © 2015 meilbn. All rights reserved.
//

#import <Foundation/Foundation.h>

@import UIKit;
@import CoreGraphics;

@interface NSString (ZKUtilities)

- (NSURL *)zk_encodedURL;

- (NSString *)zk_trimming;

- (NSString *)zk_trimWhitespace;

- (BOOL)zk_isEmpty;

- (NSString *)zk_transformToPinyin;

// 是否是字母
- (BOOL)matchLetter;

- (BOOL)hasListenChar;

- (NSURL *)ma_iTunesURL;

- (NSString *)zk_base64String;

- (NSString *)zk_base64DecodeString;

// 文字高度
- (CGFloat)zk_heightWithFont:(UIFont *)font width:(CGFloat)width;

// 文字宽度
- (CGFloat)zk_widthWithFont:(UIFont *)font height:(CGFloat)height;

- (NSAttributedString *)htmlAttributedStringForMusicDetails;

/**
 *  给文字添加行间距
 *
 *  @param text        文字
 *  @param lineSpacing 行间距
 *  @param font        字体
 *  @param textColor   颜色
 *
 *  @return 带有行间距的文字
 */
+ (NSAttributedString *)zk_attributedStringWithText:(NSString *)text lineSpacing:(CGFloat)lineSpacing font:(UIFont *)font textColor:(UIColor *)textColor;

/**
 *  判断是否包含特殊字符
 *
 *  @return 是否包含特殊字符
 */
- (BOOL)zk_containsSpecialCharacter;

@end
