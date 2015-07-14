//
//  DDViewModel.m
//  DDFramework
//
//  Created by Aimeow on 7/10/15.
//  Copyright (c) 2015 Aimeow. All rights reserved.
//

#import "DDModel.h"
#import "DDHttpManager.h"

@implementation DDModel

+(id)model{
    return [[self alloc] init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.param = [NSMutableDictionary new];
        self.requestMethod = @"GET";
    }
    return self;
}

- (void)loadData
{
    self.dataTask = [[DDHttpManager sharedInstance] requestWithURL:self.urlPath withMethod:self.requestMethod withParam:self.param completion:^(NSInteger responseStatusCode, id responseObject) {
        [self handleDataWithStatus:responseStatusCode withResponseObject:responseObject];
    }];
}

///将处理过错误的数据在子类中做处理
- (void)handleDataWithStatus : (NSInteger)status withResponseObject:(id)responseObject
{
    
}

@end
