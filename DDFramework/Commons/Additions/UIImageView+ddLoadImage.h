//
//  UIImageView+ddLoadImage.h
//  DDFramework
//
//  Created by Aimeow on 7/10/15.
//  Copyright (c) 2015 Aimeow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (ddLoadImage)

- (void)dd_setImageWithURL:(NSString *)url
         placeholderImage : (UIImage *) placeholderImage;

- (void)dd_setImageWithURL:(NSString *)url
          placeholderImage:(UIImage *)placeholderImage
                completion:(void (^)(UIImage *image))completion;

@end
