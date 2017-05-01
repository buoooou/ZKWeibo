//
//  ZKUIFactory.m
//  ZKWeibo
//
//  Created by 张阔 on 2017/5/1.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import "ZKUIFactory.h"

@implementation ZKUIFactory

#pragma mark - UIView

+ (UIView *)separatorLine {
    UIView *view = [UIView new];
    view.backgroundColor = ZKSeparatorColor;
    
    return view;
}

#pragma mark - UIBUtton

+ (UIButton *)buttonWithImageName:(NSString *)imageName highlightImageName:(NSString *)highlightImageName target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (IsStringNotEmpty(imageName)) {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    
    if (IsStringNotEmpty(highlightImageName)) {
        [button setImage:[UIImage imageNamed:highlightImageName] forState:UIControlStateHighlighted];
    }
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

+ (UIButton *)buttonWithImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName target:(id)target action:(SEL)action {
    UIButton *button = [ZKUIFactory buttonWithImageName:imageName highlightImageName:nil target:target action:action];
    if (IsStringNotEmpty(selectedImageName)) {
        [button setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    }
    
    return button;
}

+ (UIButton *)buttonWithBackgroundImageName:(NSString *)imageName highlightImageName:(NSString *)highlightImageName target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (IsStringNotEmpty(imageName)) {
        [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    
    if (IsStringNotEmpty(highlightImageName)) {
        [button setBackgroundImage:[UIImage imageNamed:highlightImageName] forState:UIControlStateHighlighted];
    }
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(NSInteger)fontSize target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    if (titleColor) {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    
    button.titleLabel.font = FontWithSize(fontSize);
    
    if (target) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    return button;
}

#pragma mark - UILabel

+ (UILabel *)labelWithTextColor:(UIColor *)textColor font:(UIFont *)font {
    return [ZKUIFactory labelWithTextColor:textColor font:font numberOfLine:1];
}

+ (UILabel *)labelWithTextColor:(UIColor *)textColor font:(UIFont *)font numberOfLine:(NSInteger)numberOfLine {
    UILabel *label = [UILabel new];
    label.backgroundColor = [UIColor whiteColor];
    label.textColor = textColor;
    label.font = font;
    label.numberOfLines = numberOfLine;
    
    return label;
}

@end
