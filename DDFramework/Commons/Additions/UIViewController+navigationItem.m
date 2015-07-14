//
//  UIViewController+navigationItem.m
//  DDFramework
//
//  Created by Aimeow on 7/10/15.
//  Copyright (c) 2015 Aimeow. All rights reserved.
//

#import "UIViewController+navigationItem.h"
#import "UIBarButtonItem+Badge.h"

@implementation UIViewController (navigationItem)

- (void)setNavigationItemLeftWithTitle : (NSString *)title leftButtonClicked : (VoidCompletionBlock)block
{
    UIButton* item = [UIButton new];
    
    [item setTitle:title forState:UIControlStateNormal];
    [item sizeToFit];
    item.rac_command =  [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        block();
        return [RACSignal empty];
    }];
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:item] animated:YES];
}

- (void)setNavigationItemRightWithTitle : (NSString *)title rightButtonClicked : (VoidCompletionBlock)block
{
    UIButton* item = [UIButton new];
    
    [item setTitle:title forState:UIControlStateNormal];
    [item sizeToFit];
    item.rac_command =  [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        block();
        return [RACSignal empty];
    }];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:item] animated:YES];
}

- (void)setNavigationItemRightWithTitle:(NSString *)title withBadgeCount : (NSString *)count rightButtonClicked: (VoidCompletionBlock)block
{
    UIButton* item = [UIButton new];
    
    [item setTitle:title forState:UIControlStateNormal];
    [item sizeToFit];
    
    item.rac_command =  [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        block();
        return [RACSignal empty];
    }];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:item];
    [barButtonItem setBadgeValue:count];
    [self.navigationItem setRightBarButtonItem:barButtonItem animated:YES];
}

- (void)setNavigationItemLeftWithImage : (UIImage *)image leftButtonClicked : (VoidCompletionBlock)block
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, image.size.width, image.size.width);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    ((UIBarButtonItem *)(self.navigationItem.leftBarButtonItem.customView)).rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        block();
        return [RACSignal empty];
    }];
}

- (void)setNavigationItemRightWithImage : (UIImage *)image rightButtonClicked : (VoidCompletionBlock)block
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, image.size.width, image.size.width);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    ((UIBarButtonItem *)(self.navigationItem.rightBarButtonItem.customView)).rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        block();
        return [RACSignal empty];
    }];
}

- (void)setNavigationTitleImage : (UIImage *)image
{
    UIImageView* titleView = [[UIImageView alloc] initWithImage:image];
    
    self.navigationItem.titleView = titleView;
}

@end
