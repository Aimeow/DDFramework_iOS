//
//  DDBannerModel.m
//  DDFramework
//
//  Created by Aimeow on 7/13/15.
//  Copyright (c) 2015 Aimeow. All rights reserved.
//

#import "DDBannerModel.h"

@implementation DDBannerModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.bannerArray = [NSMutableArray new];
        
        self.urlPath = @"http://api.dudumeijia.com/banners";
        self.requestMethod = @"get";
        [self.param setObject:@"021" forKey:@"city"];
//        [self loadData];
    }
    return self;
}

///将responseObject转成实体数组
- (void)handleDataWithStatus:(NSInteger)status withResponseObject:(id)responseObject
{
    if (status >= 200 && status <= 300) {
        self.bannerArray = [DDBannerEntity objectArrayWithKeyValuesArray:responseObject];
    }
}

- (void)setIsSubBanner:(BOOL)isSubBanner
{
    _isSubBanner = isSubBanner;
    if (_isSubBanner) {
        self.urlPath = @"http://api.dudumeijia.com/subBanners";
    }else{
        self.urlPath = @"http://api.dudumeijia.com/banners";
     }
    [self loadData];
}

@end
