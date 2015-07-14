//
//  DDBannerEntity.m
//  DDFramework
//
//  Created by Aimeow on 7/13/15.
//  Copyright (c) 2015 Aimeow. All rights reserved.
//

#import "DDBannerEntity.h"

@implementation DDBannerEntity

- (instancetype)init
{
    self = [super init];
    if (self) {
        [DDBannerEntity setupReplacedKeyFromPropertyName:^NSDictionary *{
            return @{
                     @"bannerId" : @"_id",
                     };
        }];
    }
    return self;
}


@end
