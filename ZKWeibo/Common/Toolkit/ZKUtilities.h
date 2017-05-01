//
//  ZKUtilities.h
//  ZKWeibo
//
//  Created by 张阔 on 2017/4/30.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZKUtilities : NSObject

+ (NSString *)appCurrentVersion;

+ (NSString *)appCurrentBuild;

#pragma mark - String / 字符串

+ (NSString *)stringDateFormatWithddMMMyyyyEEEByNormalDateString:(NSString *)normalDateString;

+ (NSString *)stringDateFormatWithEEEddMMMyyyyByNormalDateString:(NSString *)normalDateString;

+ (NSString *)stringDateForReadDetailsDateString:(NSString *)normalDateString;

+ (NSString *)stringDateForMusicDetailsDateString:(NSString *)normalDateString;

+ (NSString *)stringDateForCommentDateString:(NSString *)normalDateString;

+ (NSAttributedString *)zk_attributedStringWithText:(NSString *)text lineSpacing:(CGFloat)lineSpacing font:(UIFont *)font textColor:(UIColor *)textColor;

+ (NSAttributedString *)zk_attributedStringWithText:(NSString *)text lineSpacing:(CGFloat)lineSpacing font:(UIFont *)font textColor:(UIColor *)textColor lineBreakMode:(NSLineBreakMode)lineBreakMode;

+ (CGRect)zk_rectWithAttributedString:(NSAttributedString *)attributedString size:(CGSize)size;

@end
