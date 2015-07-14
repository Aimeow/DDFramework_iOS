//
//  UIImageView+ddLoadImage.m
//  DDFramework
//
//  Created by Aimeow on 7/10/15.
//  Copyright (c) 2015 Aimeow. All rights reserved.
//

#import "UIImageView+ddLoadImage.h"
#import <UIImageView+WebCache.h>
#import "UIView+animation.h"

@implementation UIImageView (ddLoadImage)

- (void)dd_setImageWithURL:(NSString *)url
         placeholderImage : (UIImage *) placeholderImage
{
    [self dd_setImageWithURL:url placeholderImage:placeholderImage completion:^(UIImage *image) {
        
    }];
}

- (void)dd_setImageWithURL:(NSString *)url
          placeholderImage:(UIImage *)placeholderImage
                completion:(void (^)(UIImage *image))completion
{
    __weak UIImageView *weakSelf = self;
    [self sd_setImageWithURL:[NSURL URLWithString:url ] placeholderImage:placeholderImage options:SDWebImageRefreshCached | SDWebImageHighPriority completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        completion(image);
        [weakSelf setImage:image];
        [weakSelf startFadeTransition];
    }];
}

@end
