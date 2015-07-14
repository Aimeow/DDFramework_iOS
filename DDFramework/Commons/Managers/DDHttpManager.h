//
//  DDHttpManager.h
//  DDFramework
//
//  Created by Aimeow on 7/10/15.
//  Copyright (c) 2015 Aimeow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Reachability.h>

//typedef void (^NetworkStatusBlock)(NetworkStatus status);

@interface DDHttpManager : NSObject

DECLARE_SINGLETON(DDHttpManager)

- (NSURLSessionDataTask *)requestWithURL:(NSString *)url
                              withMethod:(NSString *)method
                               withParam:(NSDictionary *)param
                              completion:(ResponseCompletionBlock)completion;

- (NSURLSessionDataTask *)requestWithURL:(NSString *)url
                              withMethod:(NSString *)method
                               withParam:(NSDictionary *)param
                          withApiVersion:(NSString *)apiVersion
                              completion:(ResponseCompletionBlock)completion;

@end
