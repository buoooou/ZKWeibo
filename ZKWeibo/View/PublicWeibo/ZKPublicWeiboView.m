//
//  ZKHomeView.m
//  ZKWeibo
//
//  Created by 张阔 on 2017/5/1.
//  Copyright © 2017年 张阔. All rights reserved.
//

#import "ZKPublicWeiboView.h"
#import "ZKPublicWeiboItem.h"

NSString *const kZKHomeViewID = @"ZKHomeViewID";
@interface ZKPublicWeiboView ()

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIButton *diaryButton;
@property (strong, nonatomic) UIButton *likeButton;
@property (strong, nonatomic) UILabel *likeNumLabel;
@property (strong, nonatomic) UIButton *moreButton;
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIImageView *coverView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *dateLabel;
@property (strong, nonatomic) UITextView *contentTextView;
@property (strong, nonatomic) UILabel *volLabel;

@property (strong, nonatomic) MASConstraint *textViewHeightConstraint;

@end
@implementation ZKPublicWeiboView
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
    
    _diaryButton = ({
        UIButton *button = [ZKUIFactory buttonWithImageName:nil highlightImageName:nil target:self action:@selector(diaryButtonClicked)];
        [_scrollView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.sizeOffset(CGSizeMake(66, 44));
            make.left.equalTo(_scrollView).offset(8);
            make.bottom.equalTo(self).offset(-73);
        }];
        
        button;
    });
    _moreButton = ({
        UIButton *button = [ZKUIFactory buttonWithImageName:nil highlightImageName:nil target:self action:@selector(moreButtonClicked)];
        [_scrollView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@44);
            make.right.equalTo(_scrollView).offset(-8);
            make.bottom.equalTo(_diaryButton);
        }];
        
        button;
    });
    _likeNumLabel = ({
        UILabel *label = [UILabel new];
        label.textColor = ZKDarkGrayTextColor;
        label.font = FontWithSize(11);
        [_scrollView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@44);
            make.right.equalTo(_moreButton.mas_left);
            make.bottom.equalTo(_diaryButton);
        }];
        
        label;
    });
    
    _likeButton = ({
        UIButton *button = [ZKUIFactory buttonWithImageName:nil highlightImageName:nil target:self action:@selector(likeButtonClicked)];
        [_scrollView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@44);
            make.right.equalTo(_likeNumLabel.mas_left);
            make.bottom.equalTo(_diaryButton);
        }];
        
        button;
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
    _volLabel = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.textColor = ZKLightGrayTextColor;
        label.font = FontWithSize(11);
        [_contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_coverView.mas_bottom).offset(10);
            make.left.equalTo(_coverView);
        }];
        
        label;
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
            make.left.greaterThanOrEqualTo(_volLabel.mas_right).offset(4);
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
            make.top.equalTo(_volLabel.mas_bottom).offset(15);
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
}

#pragma mark - Action

- (void)diaryButtonClicked {
    if (_clickedButton) {
        _clickedButton(ZKActionTypeDiary);
    }
}

- (void)likeButtonClicked {
    if (_clickedButton) {
        _clickedButton(ZKActionTypePraise);
    }
}

- (void)moreButtonClicked {

}
- (void)coverTapped {
    
}
#pragma mark - Public Method

- (void)configureViewWithHomeItem:(ZKPublicWeiboItem *)publicWeiboItem atIndex:(NSInteger)index {
    [self configureViewWithHomeItem:publicWeiboItem atIndex:index inViewController:nil];
}

- (void)configureViewWithHomeItem:(ZKPublicWeiboItem *)publicWeiboItem atIndex:(NSInteger)index inViewController:(ZKBaseViewController *)parentViewController {
    self.viewIndex = index;
    self.parentViewController = parentViewController;
    [_coverView zk_sd_setImageWithURL:@"" placeholderImageName:@"home_cover_placeholder" cachePlachoderImage:NO];
    
    _contentTextView.attributedText = [ZKUtilities zk_attributedStringWithText:publicWeiboItem.content lineSpacing:ZKLineSpacing font:_contentTextView.font textColor:_contentTextView.textColor];
    
    _textViewHeightConstraint.equalTo(@(ceilf([ZKUtilities zk_rectWithAttributedString:_contentTextView.attributedText size:CGSizeMake((SCREEN_WIDTH - 24 - 12), CGFLOAT_MAX)].size.height) + 50));

    _scrollView.contentOffset = CGPointZero;
    
    // 如果是-1，说明是单个视图界面，则显示按钮上的图片和点赞数
//    if (index == -1) {
//        [_diaryButton setImage:[UIImage imageNamed:@"diary_normal"] forState:UIControlStateNormal];
//        [_moreButton setImage:[UIImage imageNamed:@"share_image"] forState:UIControlStateNormal];
//        [_likeButton setImage:[UIImage imageNamed:@"like_normal"] forState:UIControlStateNormal];
//        [_likeButton setImage:[UIImage imageNamed:@"like_selected"] forState:UIControlStateSelected];
//        
//        _likeNumLabel.text = [@(publicWeiboItem.praiseNum) stringValue];
//    }
    
}

@end
