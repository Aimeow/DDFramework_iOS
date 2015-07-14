//
//  DDAlertViewContent.h
//  DDFramework
//
//  Created by Aimeow on 7/10/15.
//  Copyright (c) 2015 Aimeow. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DDAlertContentViewDelegate <NSObject>

- (void) cancelButtonClicked : (UIView *)alertContentView;
- (void) otherButtonClicked : (UIView *)alertContentView;

@end

@interface DDAlertContentView : UIView

///内容的字体颜色
@property (nonatomic , strong) UIColor *contentLabelColor;
///内容的字体
@property (nonatomic , strong) UIFont *contentLabelFont;
///主按钮的字体颜色
@property (nonatomic , strong) UIColor *cancelButtonTitleColor;
///主按钮的字体
@property (nonatomic , strong) UIFont *cancelButtonFont;
///辅按钮的字体颜色
@property (nonatomic , strong) UIColor *cancelButtonBackgroundColor;
@property (nonatomic , strong) UIColor *otherButtonTitleColor;
///辅按钮的字体
@property (nonatomic , strong) UIFont *otherButtonFont;
///辅按钮的背景颜色
@property (nonatomic , strong) UIColor *otherButtonBackgroundColor;
///主按钮的背景颜色
@property (nonatomic , assign) BOOL isCloseButtonShow;

///内容的最大高度
@property (nonatomic , assign) CGFloat maxContentHeight;

//@property (nonatomic , assign) CGFloat titleImageSize;
@property (nonatomic , strong) UIImage *titleImage;

@property (nonatomic , strong) NSString *contentStr;
@property (nonatomic , strong) NSString *cancelButtonStr;
@property (nonatomic , strong) NSString *otherButtonStr;

@property (nonatomic)id<DDAlertContentViewDelegate> delegate;

@end
