//
//  DDAlertView.m
//  DDFramework
//
//  Created by Aimeow on 7/10/15.
//  Copyright (c) 2015 Aimeow. All rights reserved.
//

#import "DDAlertView.h"

#import "DDAlertView.h"

@interface DDAlertView()<DDAlertContentViewDelegate>

@property (nonatomic , strong) UIWindow *alertWindow;

///所有的按钮存在buttons中
@property (nonatomic , strong) NSMutableArray *buttons;
///遮罩层点击手势
@property (nonatomic , strong) UITapGestureRecognizer *maskViewTapGestureRecognizer;
@property (nonatomic, copy) void (^completion)(BOOL cancelled, NSInteger buttonIndex);

- (void)show;
- (void)dismiss;

@end

@implementation DDAlertView


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

- (id) initWithTitleImage : (UIImage *)titleImage withContent:(NSString *)content withCancelButtonTitle : (NSString *)cancelButtonTitle withOtherButtonTitle : (NSString *)otherButtonTitle completion : (DDAlertViewCompletionBlock)completion
{
    self = [super init];
    if (self) {
        
        [self initialize];
        
        if (titleImage) {
            self.contentView.titleImage = titleImage;
        }
        
        self.contentView.contentStr = content;
        
        if (cancelButtonTitle) {
            self.contentView.cancelButtonStr = cancelButtonTitle;
        }
        
        if (otherButtonTitle) {
            self.contentView.otherButtonStr = otherButtonTitle;
        }
        
        if (completion) {
            self.completion = completion;
        }
        
        [self show];
    }
    return self;
}

- (void)initialize
{
    [self.view addSubview:self.maskView];
    [self.view addSubview:self.contentView];
    
    ///当键盘弹出时处理事件
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(keyboardWillShown:) name:UIKeyboardWillShowNotification object:nil];
    [center addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [self.view setNeedsUpdateConstraints];
    
}

#pragma mark- Inteface layout methods

- (void)updateViewConstraints
{
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.contentView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.contentView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    [super updateViewConstraints];
}

- (void)show
{
    [self.alertWindow makeKeyAndVisible];
    [self showAnimation:self.alertWindow];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.maskView.alpha = 1.0;
    }];
}

- (void)dismiss
{
    [self dismissAnimation:self.contentView];
    [UIView animateWithDuration:(0.2) animations:^{
        self.contentView.alpha = 0;
        self.alertWindow.alpha = 0;
    } completion:^(BOOL finished) {
        [self.alertWindow removeFromSuperview];
        self.alertWindow.rootViewController = nil;
        self.alertWindow = nil;
        //        [self.mainWindow makeKeyAndVisible];
    }];
}

#pragma mark- NSNotification keyboard Methods

- (void)keyboardWillShown:(NSNotification*)notification
{
    
}

- (void)keyboardWillHide:(NSNotification*)notification
{
    
}

#pragma mark- Animation Methods

- (void)showAnimation : (UIView *)view
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    animation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.05, 1.05, 1)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1)]];
    animation.keyTimes = @[ @0, @0.5, @1 ];
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.duration = .3;
    
    [view.layer addAnimation:animation forKey:@"showAlert"];
}

- (void)dismissAnimation : (UIView *)view
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    animation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.95, 0.95, 1)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1)]];
    animation.keyTimes = @[ @0, @0.5, @1 ];
    animation.fillMode = kCAFillModeRemoved;
    animation.duration = .2;
    
    [view.layer addAnimation:animation forKey:@"dismissAlert"];
}

#pragma mark- Initialize Inteface Methods

- (UIView *)maskView
{
    if (!_maskView) {
        _maskView = [[UIView alloc] initWithFrame:self.alertWindow.bounds];
        _maskView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.25];
        _maskView.alpha = 0;
        _maskView.userInteractionEnabled = NO;
        [_maskView addGestureRecognizer:self.maskViewTapGestureRecognizer];
    }
    return _maskView;
}

- (UIWindow *)alertWindow
{
    if (!_alertWindow) {
        _alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _alertWindow.windowLevel = UIWindowLevelAlert;
        _alertWindow.backgroundColor = [UIColor clearColor];
        _alertWindow.rootViewController = self;
        [_alertWindow addSubview:self.view];
    }
    return _alertWindow;
}

- (DDAlertContentView *)contentView
{
    if (!_contentView) {
        _contentView = [[DDAlertContentView alloc] init];
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.layer.cornerRadius = 5.0;
        _contentView.clipsToBounds = YES;
        _contentView.delegate = self;
    }
    return _contentView;
}

- (UITapGestureRecognizer *)maskViewTapGestureRecognizer
{
    if (!_maskViewTapGestureRecognizer) {
        _maskViewTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(maskViewTapSelector:)];
    }
    return _maskViewTapGestureRecognizer;
}

#pragma mark- UITapGestureRecognizer Methods

- (void)maskViewTapSelector : (UITapGestureRecognizer *)gesture
{
    [self dismiss];
}

#pragma mark- DDAlertContentViewDelegate Methods

- (void)cancelButtonClicked : (UIView *)alertContentView
{
    [self dismiss];
    if (self.completion) {
        BOOL cancelled = YES;
        NSInteger buttonIndex = 1;
        self.completion(cancelled, buttonIndex);
    }
    
}

- (void)otherButtonClicked : (UIView *)alertContentView
{
    [self dismiss];
    if (self.completion) {
        BOOL cancelled = NO;
        NSInteger buttonIndex = 2;
        self.completion(cancelled, buttonIndex);
    }
}

@end
