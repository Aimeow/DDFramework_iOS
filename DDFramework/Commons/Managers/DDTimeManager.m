//
//  DDTimeManager.m
//  DDFramework
//
//  Created by Aimeow on 7/10/15.
//  Copyright (c) 2015 Aimeow. All rights reserved.
//

#import "DDTimeManager.h"


@interface DDTimeManager()

//重用formatter
@property ( nonatomic , strong) NSDateFormatter * formatter;

@end

@implementation DDTimeManager

DEFINE_SINGLETON(DDTimeManager)

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.formatter = [[NSDateFormatter alloc] init];
        self.formatter.dateStyle = NSDateFormatterMediumStyle;
        self.formatter.timeStyle = NSDateFormatterShortStyle;
        self.formatter.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
        
    }
    return self;
}

- (NSString *)dd_getTimeStamp
{
    NSDate *datenow = [NSDate date];
    NSString *timeS = [NSString stringWithFormat:@"%ld",(long)[datenow timeIntervalSince1970]];
    return [NSString stringWithFormat:@"%@000",timeS];
}

- (NSString *)dd_getTimeStampWithTimeString:(NSString*)timeStr withDateFormat : (NSString *)dateFormat
{
    self.formatter.dateFormat = dateFormat;
    NSString *timeStamp = [NSString stringWithFormat:@"%ld",(long)[[self.formatter dateFromString:timeStr] timeIntervalSince1970]];
    return  timeStamp;
}

- (NSString *)dd_getTimeStringWithFormat : (NSString *)timeStr withDateFormat : (NSString *)dateFormat
{
    self.formatter.dateFormat = dateFormat;
    NSDate *conformTimeSp = [[NSDate alloc] initWithTimeIntervalSince1970:[timeStr substringToIndex:10].doubleValue];
    return [self.formatter stringFromDate:conformTimeSp];
}

- (NSDate *)dd_getDateWithTimeStamp : (NSString *)timeStr andDateFormat : (NSString *)dateFormat
{
    self.formatter.dateFormat = dateFormat;
    
    return [self.formatter dateFromString:[self dd_getTimeStringWithFormat:timeStr withDateFormat:dateFormat]];
}

- (NSString *)dd_getTimeDateWithFormat : (NSDate *)date withDateFormat : (NSString *)dateFormat
{
    self.formatter.dateFormat = dateFormat;
    return  [self.formatter stringFromDate:date];
}


- (NSDate *)dd_getDateWithTimeString:(NSString *)timeStr withDateFormat : (NSString *)dateFormat
{
    self.formatter.dateFormat = dateFormat;
    NSDate *destDate= [self.formatter dateFromString:timeStr];
    return destDate;
}

- (NSNumber *)dd_currentTimestampWithLongLongFormat
{
    double timeStamp = ceil([[NSDate date] timeIntervalSince1970] * 1000);
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setGeneratesDecimalNumbers:false];
    NSNumber *timeNumber = [NSNumber numberWithDouble:timeStamp];
    NSString *timeString = [formatter stringFromNumber:timeNumber];
    
    return [NSNumber numberWithLongLong:[timeString longLongValue]];
}

@end
