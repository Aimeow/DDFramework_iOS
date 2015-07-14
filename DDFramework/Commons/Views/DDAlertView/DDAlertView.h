//
//  DDAlertView.h
//  DDFramework
//
//  Created by Aimeow on 7/10/15.
//  Copyright (c) 2015 Aimeow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DDAlertContentView.h"


/*
 *ToDo:
 *1.出现和消失的动画（已完成）
 *2.自定义的界面（可自定按钮，标签等的字体，颜色）
 *3.可以按照文字的内容自由控制AlertView的高度(不能超过给定的最大值)。
 *
 *Keynote:
 *1.标题为UIImageView,内容为UILabel
 *2.不能同时弹出多个alertView,避免出问题
 *3.当键盘弹起来时或是键盘弹出时弹出AlertView，AlertView随着键盘弹上去
 *
 *Future:
 *1.未来再考虑横竖屏兼容
 *2.内容的UILabel优化为TTTAtributeLabel
 */

typedef void(^DDAlertViewCompletionBlock)(BOOL cancelled, NSInteger buttonIndex);

@interface DDAlertView : UIViewController
///AlertView的主体
@property (nonatomic , strong) DDAlertContentView *contentView;
///遮罩层..若将maskView的userInteractionEnabled设为YES,则点击背景就可以dimiss掉界面，默认为NO
@property (nonatomic , strong) UIView *maskView;

- (id) initWithTitleImage : (UIImage *)titleImage withContent:(NSString *)content withCancelButtonTitle : (NSString *)cancelButtonTitle withOtherButtonTitle : (NSString *)otherButtonTitle completion : (DDAlertViewCompletionBlock)completion;

//+ (void)showTitleWithImage : (UIImage *)titleImage withContent : (NSString *)content;
//
//+ (void)showTitleWithImage:(UIImage *)titleImage withContent:(NSString *)content withCancelButtonTitle : (NSString *)cancelButtonTitle withOtherButtonTitle : (NSString *)otherButtonTitle completion : (DDAlertViewCompletionBlock)completion;

@end
