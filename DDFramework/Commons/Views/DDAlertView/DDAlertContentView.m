//
//  DDAlertViewContent.m
//  DDFramework
//
//  Created by Aimeow on 7/10/15.
//  Copyright (c) 2015 Aimeow. All rights reserved.
//

#import "DDAlertContentView.h"


#import "DDAlertViewCloseButton.H"


@interface DDAlertContentView()

///AlertView的标题（图片）
@property (nonatomic , strong) UIImageView *titleImageView;
///AlertView中间的内容Label
@property (nonatomic , strong) UILabel *contentLabel;
///主要的按钮
@property (nonatomic , strong) UIButton *cancelButton;
///次要的按钮
@property (nonatomic , strong) UIButton *otherButton;
///右上角关闭按钮（同取消操作）
@property (nonatomic , strong) DDAlertViewCloseButton *closeButton;
@property (nonatomic , strong) NSArray *constraintsArray;

@end

@implementation DDAlertContentView

- (instancetype)init
{
    self = [super init];
    if (self) {
        //        self.
        [self initialize];
        //        self.view.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (void)initialize
{
    self.maxContentHeight = 200;
    self.constraintsArray = [NSArray new];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
//    self.width = DDAlertViewWidth;
//    self.height = self.maxContentHeight;
    
    self.contentLabelFont = [UIFont systemFontOfSize:15];
    self.contentLabelColor = [UIColor darkGrayColor];
    self.maxContentHeight = 200;
    
    self.cancelButtonFont = [UIFont systemFontOfSize:14];
    
    self.otherButtonFont = self.cancelButtonFont;
    
    [self addSubview:self.titleImageView];
    [self addSubview:self.closeButton];
    
    [self addSubview:self.contentLabel];
    ///至少存在一个按钮
    [self addSubview:self.cancelButton];
    [self addSubview:self.otherButton];
    //    ///当buttons中数目等于2，则将另个按钮加进去
    //    if ([self.buttons count] == 2) {
    //        [self.contentView addSubview:self.otherButton];
    //    }
    [self setNeedsUpdateConstraints];
}

#pragma mark- Inteface layout methods

- (void)updateConstraints
{
    NSDictionary *viewDic = @{
                              @"titleImageView" : self.titleImageView ,
                              @"closeButton" : self.closeButton ,
                              @"contentLabel" : self.contentLabel ,
                              @"cancelButton" : self.cancelButton ,
                              @"otherButton" : self.otherButton ,
                              @"self" : self
                              };
    
    for (NSArray *constraints in self.constraintsArray) {
        [self removeConstraints:constraints];
    }
    
    self.constraintsArray = [NSArray new];
    self.constraintsArray = [self.constraintsArray arrayByAddingObjectsFromArray: @[
                                  [NSLayoutConstraint constraintsWithVisualFormat:@"H:[self(300)]"  options:0 metrics:nil views:viewDic] ,
                                  [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[titleImageView]-15-[contentLabel]"  options:0 metrics:nil views:viewDic] ,
                                  [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[contentLabel]-15-|"  options:0 metrics:nil views:viewDic] ,
                                  [NSLayoutConstraint constraintsWithVisualFormat:@"V:[contentLabel]-15-[cancelButton(35)]-12-|"  options:0 metrics:nil views:viewDic] ,
                                  [NSLayoutConstraint constraintsWithVisualFormat:@"V:[contentLabel]-15-[otherButton(35)]-12-|"  options:0 metrics:nil views:viewDic] ,
                                  [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[titleImageView]-|"  options:0 metrics:nil views:viewDic] ,
                                  [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[closeButton]"  options:0 metrics:nil views:viewDic] ,
                                  [NSLayoutConstraint constraintsWithVisualFormat:@"H:[closeButton]|"  options:0 metrics:nil views:viewDic] ,
                                  ]];

    if ([[self.otherButton titleForState:UIControlStateNormal] isEqualToString:@""]) {
        self.otherButton.hidden = YES;
        self.constraintsArray = [self.constraintsArray arrayByAddingObjectsFromArray:@[
                                                                             [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-12-[cancelButton]-12-|"  options:0 metrics:nil views:viewDic]
                                                                             ]];
    }else{
        self.constraintsArray = [self.constraintsArray arrayByAddingObjectsFromArray:@[
                                                                             [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-12-[cancelButton(otherButton)]-8-[otherButton]-12-|"  options:0 metrics:nil views:viewDic]
                                                                             ]];
        self.otherButton.hidden = NO;
    }
    
    
    for (NSArray *constraints in self.constraintsArray){
        [self addConstraints:constraints];
    }
    
    [super updateConstraints];
}

#pragma mark- Setter Methods

- (void)setContentLabelColor:(UIColor *)contentLabelColor
{
    _contentLabelColor = contentLabelColor;
    self.contentLabel.textColor = _contentLabelColor;
}

- (void)setContentLabelFont:(UIFont *)contentLabelFont
{
    _contentLabelFont = contentLabelFont;
    self.contentLabel.font = _contentLabelFont;
    [self setNeedsUpdateConstraints];
}

- (void)setCancelButtonTitleColor:(UIColor *)cancelButtonTitleColor
{
    _cancelButtonTitleColor = cancelButtonTitleColor;
    [self.cancelButton setTitleColor:_cancelButtonTitleColor forState:UIControlStateNormal];
}

- (void)setCancelButtonFont:(UIFont *)cancelButtonFont
{
    _cancelButtonFont = cancelButtonFont;
    self.cancelButton.titleLabel.font = _cancelButtonFont;
}

- (void)setCancelButtonBackgroundColor:(UIColor *)cancelButtonBackgroundColor
{
    _cancelButtonBackgroundColor = cancelButtonBackgroundColor;
    self.cancelButton.backgroundColor = _cancelButtonBackgroundColor;
}

- (void)setIsCloseButtonShow:(BOOL)isCloseButtonShow
{
    _isCloseButtonShow = isCloseButtonShow;
    self.closeButton.hidden = !_isCloseButtonShow;
}

- (void)setOtherButtonFont:(UIFont *)otherButtonFont
{
    _otherButtonFont = otherButtonFont;
    self.otherButton.titleLabel.font = _otherButtonFont;
}

- (void)setOtherButtonTitleColor:(UIColor *)otherButtonTitleColor
{
    _otherButtonTitleColor = otherButtonTitleColor;
    [self.otherButton setTitleColor:_otherButtonTitleColor forState:UIControlStateNormal];
}

- (void)setOtherButtonBackgroundColor:(UIColor *)otherButtonBackgroundColor
{
    _otherButtonBackgroundColor = otherButtonBackgroundColor;
    _otherButton.backgroundColor = _otherButtonBackgroundColor;
}

- (void)setContentStr:(NSString *)contentStr
{
    _contentStr = contentStr;
    self.contentLabel.text = _contentStr;
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

- (void)setCancelButtonStr:(NSString *)cancelButtonStr
{
    _cancelButtonStr = cancelButtonStr;
    [self.cancelButton setTitle:_cancelButtonStr forState:UIControlStateNormal];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

- (void)setOtherButtonStr:(NSString *)otherButtonStr
{
    _otherButtonStr = otherButtonStr;
    [self.otherButton setTitle:_otherButtonStr forState:UIControlStateNormal];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

- (void)setTitleImage:(UIImage *)titleImage
{
    _titleImage = titleImage;
    if (_titleImage) {
        self.titleImageView.image = _titleImage;
//        self.titleImageView.size = titleImage.size;
    }
}

#pragma mark- Initialize Inteface Methods

- (UIImageView *)titleImageView
{
    if (!_titleImageView) {
        _titleImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [_titleImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_titleImageView setContentMode:UIViewContentModeCenter];
        //_titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, DDTitleImageSize, DDTitleImageSize)];
        ///设置默认标题图片
        //_titleImageView.image = [UIImage imageNamed:@"checkBlue"];
        
    }
    return _titleImageView;
}

- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = UILabel.new;
        _contentLabel.backgroundColor = [UIColor clearColor];
        //        _contentLabel.backgroundColor = [UIColor redColor];
        _contentLabel.textColor = self.contentLabelColor;
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.font = self.contentLabelFont;
        _contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
        _contentLabel.numberOfLines = 0;
        //        _contentView.frame = [self adjustLabelFrameHeight:self.messageLabel];
        [_contentLabel setTranslatesAutoresizingMaskIntoConstraints:NO];

        
    }
    return _contentLabel;
}

- (DDAlertViewCloseButton *)closeButton
{
    if (!_closeButton) {
        _closeButton = [[DDAlertViewCloseButton alloc] initWithSize:15 withColor:[UIColor grayColor]] ;
        [_closeButton addTarget:self action:@selector(cancelButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_closeButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _closeButton;
    
}

- (UIButton *)cancelButton
{
    if (!_cancelButton) {
        _cancelButton = [[UIButton alloc] initWithFrame:CGRectZero];
        _cancelButton.layer.masksToBounds = YES;
        _cancelButton.layer.cornerRadius =  [self.cancelButton systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height / 2;
        _cancelButton.backgroundColor = [UIColor purpleColor];
        [_cancelButton addTarget:self action:@selector(cancelButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        ///设置默认的按钮文字
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTranslatesAutoresizingMaskIntoConstraints:NO];

    }
    return _cancelButton;
}

- (UIButton *)otherButton
{
    if (!_otherButton) {
        _otherButton = [[UIButton alloc] initWithFrame:CGRectZero];
        _otherButton.layer.masksToBounds = YES;
        _otherButton.layer.cornerRadius = [self.otherButton systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height / 2;
        _otherButton.backgroundColor = [UIColor greenColor];
        [_otherButton addTarget:self action:@selector(otherButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        ///设置默认的按钮文字
        [_otherButton setTitle:@"" forState:UIControlStateNormal];
        [_otherButton setTranslatesAutoresizingMaskIntoConstraints:NO];

    }
    return _otherButton;
}

#pragma mark- UIButton Selector Methods

- (void)cancelButtonClicked : (UIButton *) sender
{
    if ([self.delegate respondsToSelector:@selector(cancelButtonClicked:)]) {
        [self.delegate cancelButtonClicked:self];
    }
}

- (void)otherButtonClicked : (UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(otherButtonClicked:)]) {
        [self.delegate otherButtonClicked:self];
    }
}

@end
