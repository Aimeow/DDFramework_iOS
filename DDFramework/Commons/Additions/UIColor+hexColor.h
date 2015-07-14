//
//  UIColor+hexColor.h
//  DDFramework
//
//  Created by Aimeow on 7/10/15.
//  Copyright (c) 2015 Aimeow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (hexColor)

/*!
 * @method colorwithHexString
 * 通过Hex颜色色值转换成标准颜色 , 可调透明度
 */
+ (UIColor *)colorwithHexString:(NSString *)hexString alpha:(float)alpha;

/*!
 * @method colorwithHexString
 * 通过Hex颜色色值转换成标准颜色
 */
+ (UIColor *)colorwithHexString:(NSString *)hexString;

@end