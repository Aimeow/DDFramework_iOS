//
//  DDTimeManager.h
//  DDFramework
//
//  Created by Aimeow on 7/10/15.
//  Copyright (c) 2015 Aimeow. All rights reserved.
//

#import <Foundation/Foundation.h>

///所有和时间有关的操作都放在这里，NSDateFormatter比较占资源，所以尽可能写在这个类去复用。
@interface DDTimeManager : NSObject

DECLARE_SINGLETON(DDTimeManager)

/*!
 * @method dd_getTimeStamp
 * 获取当前的时间戳
 */
- (NSString *)dd_getTimeStamp;

/*!
 * @method dd_getTimeStampWithTimeString
 * 获取指定时间字符串以及格式的时间戳
 */
- (NSString *)dd_getTimeStampWithTimeString:(NSString*)timeStr withDateFormat : (NSString *)dateFormat;

/*!
 * @method dd_getTimeStringWithFormat
 * 将传入时间戳，转换成传入的格式
 */
- (NSString *)dd_getTimeStringWithFormat : (NSString *)timeStr withDateFormat : (NSString *)dateFormat;

/*!
 * @method dd_getTimeDateWithFormat
 * 将传入的NSDate，转换成传入的格式的字符串
 */
- (NSString *)dd_getTimeDateWithFormat : (NSDate *)date withDateFormat : (NSString *)dateFormat;

/*!
 * @method dd_getDateWithTimeStamp
 * 将传入的时间戳，转换成传入的格式的NSDate
 */
- (NSDate *)dd_getDateWithTimeStamp : (NSString *)timeStr andDateFormat : (NSString *)dateFormat;

/*!
 * @method dd_getDateWithTimeString
 * 将传入时间字符串以及格式，转换成NSDate
 */
- (NSDate *)dd_getDateWithTimeString : (NSString *)timeStr withDateFormat : (NSString *)dateFormat;

/*!
 * @method dd_currentTimestampWithLongLongFormat
 * 获取NSNumber格式的时间戳
 */
- (NSNumber *)dd_currentTimestampWithLongLongFormat;

@end
