//
//  ZKUIFactory.h
//  ZKWeibo
//
//  Created by 张阔 on 2017/5/1.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZKUIFactory : NSObject
#pragma mark - UIView

+ (UIView *)separatorLine;

#pragma mark - UIBUtton

+ (UIButton *)buttonWithImageName:(NSString *)imageName highlightImageName:(NSString *)highlightImageName target:(id)target action:(SEL)action;

+ (UIButton *)buttonWithImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName target:(id)target action:(SEL)action;

+ (UIButton *)buttonWithBackgroundImageName:(NSString *)imageName highlightImageName:(NSString *)highlightImageName target:(id)target action:(SEL)action;

+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(NSInteger)fontSize target:(id)target action:(SEL)action;

#pragma mark - UILabel

+ (UILabel *)labelWithTextColor:(UIColor *)textColor font:(UIFont *)font;

+ (UILabel *)labelWithTextColor:(UIColor *)textColor font:(UIFont *)font numberOfLine:(NSInteger)numberOfLine;

@end
