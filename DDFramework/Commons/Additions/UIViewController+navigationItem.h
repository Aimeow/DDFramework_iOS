//
//  UIViewController+navigationItem.h
//  DDFramework
//
//  Created by Aimeow on 7/10/15.
//  Copyright (c) 2015 Aimeow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (navigationItem)

- (void)setNavigationItemLeftWithTitle : (NSString *)title leftButtonClicked : (VoidCompletionBlock)block;
- (void)setNavigationItemRightWithTitle : (NSString *)title rightButtonClicked : (VoidCompletionBlock)block;
- (void)setNavigationItemRightWithTitle:(NSString *)title withBadgeCount : (NSString *)count rightButtonClicked: (VoidCompletionBlock)block;
- (void)setNavigationItemLeftWithImage : (UIImage *)image leftButtonClicked : (VoidCompletionBlock)block;
- (void)setNavigationItemRightWithImage : (UIImage *)image rightButtonClicked : (VoidCompletionBlock)block;
- (void)setNavigationTitleImage : (UIImage *)image;

@end
