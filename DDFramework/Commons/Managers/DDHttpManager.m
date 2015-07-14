//
//  DDHttpManager.m
//  DDFramework
//
//  Created by Aimeow on 7/10/15.
//  Copyright (c) 2015 Aimeow. All rights reserved.
//

#import "DDHttpManager.h"
#import <AFNetworking.h>

@interface DDHttpManager ()

@property (nonatomic , strong) AFURLSessionManager *manager;

@end

@implementation DDHttpManager

DEFINE_SINGLETON(DDHttpManager)

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:
                        [NSURLSessionConfiguration defaultSessionConfiguration]];
//        [self.manager setResponseSerializer: [AFHTTPResponseSerializer serializer]];
    }
    return self;
}

- (NSURLSessionDataTask *)requestWithURL:(NSString *)url
                              withMethod:(NSString *)method
                               withParam:(NSDictionary *)param
                              completion:(ResponseCompletionBlock)completion
{
    return [self requestWithURL:url
                     withMethod:method
                      withParam:param
                 withApiVersion:APIVersion
                     completion:completion];
}

- (NSURLSessionDataTask *)requestWithURL:(NSString *)url
            withMethod:(NSString *)method
             withParam:(NSDictionary *)param
                          withApiVersion:(NSString *)apiVersion
               completion:(ResponseCompletionBlock)completion
{
    ///返回dataTask，可以做取消，继续等处理
    ///[dataTask cancel];
    NSURLSessionDataTask *dataTask = nil;
    ///处理公共部分
    NSMutableURLRequest *urlRequest = [[AFHTTPRequestSerializer serializer]
                                       requestWithMethod:method.uppercaseString
                                       URLString:url
                                       parameters:param
                                       error:nil];
    
    ///在headerField中加入版本（公共参数）
    if (apiVersion && apiVersion.length>0) {
        [urlRequest setValue:apiVersion forHTTPHeaderField:@"Accept-Version"];
    }else {
        [urlRequest setValue:nil forHTTPHeaderField:@"Accept-Version"];
    }
    
    ///在headerField中加入User-Agent参数（公共参数）
    NSString *userAgent = [NSString
                           stringWithFormat:@"Qairen(deviceName=%@:deviceVer=%@:sysName=%@:sysVer=%@:appName=%@:appVer=%@;%zd*%zd&deviceID=%@&mac=%@&idfa=%@&idfv=%@)",
                           [[UIDevice currentDevice] model],
                           [DDCommonMethod dd_deviceVerString] ,
                           [[UIDevice currentDevice] systemName],
                           [[UIDevice currentDevice] systemVersion],
                           PRODUCT_NAME,
                           PROGRAM_VERSION,
                           kScreenWidth ,
                           kScreenHeight ,
                           [DDCommonMethod dd_openUniqueIdentifier] ,
                           [DDCommonMethod dd_macString],
                           [DDCommonMethod dd_idfaString],
                           [DDCommonMethod dd_idfvString]];
    [urlRequest setValue:userAgent forHTTPHeaderField:@"User-Agent"];
    
    ///在headerField中加入X-UDID参数（公共参数）
    [urlRequest setValue:[NSString
                          stringWithFormat:@"deviceID=%@&mac=%@&idfa=%@&idfv=%@",
                          [DDCommonMethod dd_openUniqueIdentifier],
                          [DDCommonMethod dd_macString],
                          [DDCommonMethod dd_idfaString],
                          [DDCommonMethod dd_idfvString]] forHTTPHeaderField:@"X-UDID"];
    
    dataTask = [self.manager dataTaskWithRequest:urlRequest completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        ///返回请求后的状态码
        NSInteger responseStatusCode = [(NSHTTPURLResponse *)response statusCode];
        completion(responseStatusCode , responseObject);
    }];
    [dataTask resume];
    return dataTask;
}

@end
