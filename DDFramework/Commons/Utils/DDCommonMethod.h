//
//  DDCommonMethod.h
//  DDFramework
//
//  Created by Aimeow on 7/13/15.
//  Copyright (c) 2015 Aimeow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDCommonMethod : NSObject

/**
 *  @author Aimeow, 2015-07-13
 *
 *  获取mac的标识
 *
 *  @return 返回mac的标识字符串
 */
+ (NSString * )dd_macString;

/**
 *  @author Aimeow, 2015-07-13
 *
 *  获取idfa字符(所以加了广告，否则会被拒)
 *
 *  @return 获取idfa字符
 */
+ (NSString *)dd_idfaString;

/**
 *  @author Aimeow, 2015-07-13
 *
 *  获取idfv字符串
 *
 *  @return 获取idfv字符串
 */
+ (NSString *)dd_idfvString;

/**
 *  @author Aimeow, 2015-07-13
 *
 *  获取得IOS设备型号
 *
 *  @return 获取得IOS设备型号
 */
+ (NSString*)dd_deviceVerString;

/**
 *  @author Aimeow, 2015-07-13
 *
 *  获取得IOS设备唯一标识
 *
 *  @return 获取得IOS设备唯一标识
 */
+ (NSString *)dd_openUniqueIdentifier;

@end
