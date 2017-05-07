//
//  ZKHomeView.m
//  ZKWeibo
//
//  Created by 张阔 on 2017/5/1.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import "ZKPublicWeiboView.h"
#import "ZKPublicWeiboItem.h"
#import "UIView+ZKWeibo.h"

NSString *const kZKHomeViewID = @"ZKHomeViewID";
@interface ZKPublicWeiboView ()

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIImageView *coverView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *dateLabel;
@property (strong, nonatomic) UITextView *contentTextView;

@property (strong, nonatomic) UIImageView *userAvatar;
@property (strong, nonatomic) UILabel *userName;

@property (strong, nonatomic) MASConstraint *textViewHeightConstraint;

@end
@implementation ZKPublicWeiboView{
//    NSString *avatar_HD;
//    UIImageView *avatar_image;
}
#pragma mark - LifeCycle

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self setupViews];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setupViews];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self setupViews];
    }
    
    return self;
}
#pragma mark - Private Method

- (void)setupViews {
    if (_scrollView) {
        return;
    }
    
    self.backgroundColor = [UIColor clearColor];
    
    _scrollView = ({
        UIScrollView *scrollView = [UIScrollView new];
        scrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:scrollView];
        [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        scrollView;
    });
    
    _contentView = ({
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor whiteColor];
        view.layer.shadowColor = ZKShadowColor.CGColor;// #666666
        view.layer.shadowRadius = 2;
        view.layer.shadowOffset = CGSizeZero;
        view.layer.shadowOpacity = 0.5;
        view.layer.cornerRadius = 5;
        [_scrollView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_scrollView).insets(UIEdgeInsetsMake(76, 12, 184, 12));
            make.width.equalTo(@(SCREEN_WIDTH - 24));
        }];
        
        view;
    });
    _coverView = ({
        UIImageView *imageView = [UIImageView new];
        imageView.backgroundColor = [UIColor whiteColor];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.clipsToBounds = YES;
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(coverTapped)];
        [imageView addGestureRecognizer:tap];
        [_contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(_contentView).insets(UIEdgeInsetsMake(6, 6, 0, 6));
            make.height.equalTo(imageView.mas_width).multipliedBy(0.75);
        }];
        
        imageView;
    });
    _titleLabel = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.textColor = ZKGrayTextColor;
        label.font = FontWithSize(10);
        label.textAlignment = NSTextAlignmentRight;
        [label setContentHuggingPriority:251 forAxis:UILayoutConstraintAxisHorizontal];
        [_contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_coverView.mas_bottom).offset(8);
            make.right.equalTo(_coverView);
        }];
        
        label;
    });
    
    _contentTextView = ({
        UITextView *textView = [UITextView new];
        textView.backgroundColor = [UIColor whiteColor];
        textView.textColor = ZKLightBlackTextColor;
        textView.font = FontWithSize(14);
        textView.editable = NO;
        [_contentView addSubview:textView];
        [textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLabel.mas_bottom).offset(15);
            make.left.right.equalTo(_coverView);
            _textViewHeightConstraint = make.height.equalTo(@0);
        }];
        
        textView;
    });
    
    _dateLabel = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.textColor = ZKDarkGrayTextColor;
        label.font = FontWithSize(12);
        [_contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_contentTextView.mas_bottom).offset(10);
            make.right.equalTo(_coverView);
            make.bottom.equalTo(_contentView).offset(-12);
        }];
        
        label;
    });
    _userAvatar = ({
        UIImageView *imageView = [UIImageView new];
        imageView.backgroundColor = [UIColor whiteColor];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.clipsToBounds = YES;
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(coverUserAvatarTapped)];
        [imageView addGestureRecognizer:tap];
        [_contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.sizeOffset(CGSizeMake(25, 25));
            make.top.equalTo(_contentTextView.mas_bottom).offset(10);
            make.left.equalTo(_coverView);
        }];
        
        imageView;
    });
    _userName = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.textColor = ZKDarkGrayTextColor;
        label.font = FontWithSize(12);
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(coverUserAvatarTapped)];
        [label addGestureRecognizer:tap];
        [_contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_contentTextView.mas_bottom).offset(16);
            make.left.equalTo(_userAvatar.mas_right).offset(10);
        }];
        
        label;
    });
    
}

#pragma mark - Action


- (void)coverTapped {
    [self blowUpImage:_coverView.image referenceRect:_coverView.frame referenceView:_coverView.superview];
}

- (void)coverUserAvatarTapped {
    
    //[self blowUpImage:_userAvatar.image referenceRect:_userAvatar.frame referenceView:_userAvatar.superview];
}

#pragma mark - Public Method

- (void)configureViewWithHomeItem:(ZKPublicWeiboItem *)publicWeiboItem atIndex:(NSInteger)index {
    [self configureViewWithHomeItem:publicWeiboItem atIndex:index inViewController:nil];
}

- (void)configureViewWithHomeItem:(ZKPublicWeiboItem *)publicWeiboItem atIndex:(NSInteger)index inViewController:(ZKBaseViewController *)parentViewController {
    self.viewIndex = index;
    self.parentViewController = parentViewController;
    [_coverView zk_sd_setImageWithURL:publicWeiboItem.picture placeholderImageName:@"home_cover_placeholder" cachePlachoderImage:NO];
    _contentTextView.attributedText = [ZKUtilities zk_attributedStringWithText:publicWeiboItem.content lineSpacing:ZKLineSpacing font:_contentTextView.font textColor:_contentTextView.textColor];
    
    _textViewHeightConstraint.equalTo(@(ceilf([ZKUtilities zk_rectWithAttributedString:_contentTextView.attributedText size:CGSizeMake((SCREEN_WIDTH - 24 - 12), CGFLOAT_MAX)].size.height) + 50));

    _scrollView.contentOffset = CGPointZero;
    _titleLabel.text = [ZKUtilities stringSourceWithA:publicWeiboItem.source];
    _dateLabel.text = [ZKUtilities stringDateForCommentDate:publicWeiboItem.created_time];

    [_userAvatar zk_sd_setImageWithURL:publicWeiboItem.user.avatar placeholderImageName:@"home_cover_placeholder" cachePlachoderImage:NO];
    _userName.text=publicWeiboItem.user.nickname;
}

@end
