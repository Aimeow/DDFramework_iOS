//
//  DDViewModel.h
//  DDFramework
//
//  Created by Aimeow on 7/10/15.
//  Copyright (c) 2015 Aimeow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDModel : NSObject

@property (nonatomic , strong) NSString *urlPath;
@property (nonatomic , strong) NSMutableDictionary *param;
@property (nonatomic , strong) NSString *requestMethod;
@property (nonatomic , strong) NSURLSessionDataTask *dataTask;

+ (id)model;

- (void)loadData;

///将处理过错误的数据在子类中做处理
- (void)handleDataWithStatus : (NSInteger)status withResponseObject:(id)responseObject;

@end
