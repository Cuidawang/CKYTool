//
//  NSData+LSExtension.h
//  redlips
//
//  Created by zizp on 15/7/28.
//  Copyright (c) 2015年 xiaohongchun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (LSExtension)

@property (readonly, nonatomic) NSInteger ls_year;
@property (readonly, nonatomic) NSInteger ls_month;
@property (readonly, nonatomic) NSInteger ls_day;
@property (readonly, nonatomic) NSInteger ls_weekday;
@property (readonly, nonatomic) NSInteger ls_weekOfYear;
@property (readonly, nonatomic) NSInteger ls_hour;
@property (readonly, nonatomic) NSInteger ls_minute;
@property (readonly, nonatomic) NSInteger ls_second;

@property (readonly, nonatomic) NSDate    *ls_dateByIgnoringTimeComponents;
@property (readonly, nonatomic) NSDate    *ls_firstDayOfMonth;
@property (readonly, nonatomic) NSDate    *ls_lastDayOfMonth;
@property (readonly, nonatomic) NSInteger ls_numberOfDaysInMonth;

- (NSDate *)ls_dateByAddingYears:(NSInteger)years;
- (NSDate *)ls_dateBySubtractingYears:(NSInteger)years;
- (NSDate *)ls_dateByAddingMonths:(NSInteger)months;
- (NSDate *)ls_dateBySubtractingMonths:(NSInteger)months;
- (NSDate *)ls_dateByAddingWeeks:(NSInteger)weeks;
- (NSDate *)ls_dateBySubtractingWeeks:(NSInteger)weeks;
- (NSDate *)ls_dateByAddingDays:(NSInteger)days;
- (NSDate *)ls_dateBySubtractingDays:(NSInteger)days;
- (NSString *)ls_stringWithFormat:(NSString *)format;

/**
 *  获取 From date to self 的年
 *  @param date  日期
 *  @return date 的年
 */
- (NSInteger)ls_yearsFrom:(NSDate *)date;

/**
 *  获取 From date to self 的月
 *  @param date  日期
 *  @return date 的月
 */
- (NSInteger)ls_monthsFrom:(NSDate *)date;

/**
 *  获取 From date to self 的星期
 *  @param date  日期
 *  @return date 的星期
 */
- (NSInteger)ls_weeksFrom:(NSDate *)date;

/**
 *  获取 From date to self 的天数
 *  @param date  日期
 *  @return date 的日
 */
- (NSInteger)ls_daysFrom:(NSDate *)date;

/**
 *  判断 date 是否是当前月
 *  @param date 需要判断的 date
 *  @return YES or NO
 */
- (BOOL)ls_isEqualToDateForMonth:(NSDate *)date;

/**
 *  判断 date 是否是当前周
 *  @param date 需要判断的 date
 *  @return YES or NO
 */
- (BOOL)ls_isEqualToDateForWeek:(NSDate *)date;

/**
 *  判断 date 是否是当前日
 *  @param date 需要判断的 date
 *  @return YES or NO
 */
- (BOOL)ls_isEqualToDateForDay:(NSDate *)date;

/**
 *  实例化一个 date
 *  @param string eg:@"2015-07-28"
 *  @param format eg:@"yyyy-MM-dd"
 *  @return date
 */
+ (instancetype)ls_dateFromString:(NSString *)string format:(NSString *)format;

/**
 *  实例化一个 date
 *  @param year  eg:@"2015"
 *  @param month eg:@"07"
 *  @param day   eg:@"28"
 *  @return date
 */
+ (instancetype)ls_dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

@end


@interface NSCalendar (LSExtension)

+ (instancetype)ls_sharedCalendar;

@end



