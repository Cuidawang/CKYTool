//
//  NSData+LSExtension.m
//  redlips
//
//  Created by zizp on 15/7/28.
//  Copyright (c) 2015年 xiaohongchun. All rights reserved.
//

#import "NSDate+LSExtension.h"

@implementation NSDate (LSExtension)

- (NSInteger)ls_year
{
    NSCalendar *calendar = [NSCalendar ls_sharedCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitYear
                                              fromDate:self];
    return component.year;
}

- (NSInteger)ls_month
{
    NSCalendar *calendar = [NSCalendar ls_sharedCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitMonth
                                              fromDate:self];
    return component.month;
}

- (NSInteger)ls_day
{
    NSCalendar *calendar = [NSCalendar ls_sharedCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitDay
                                              fromDate:self];
    return component.day;
}

- (NSInteger)ls_weekday
{
    NSCalendar *calendar = [NSCalendar ls_sharedCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitWeekday
                                              fromDate:self];
    return component.weekday;
}

- (NSInteger)ls_weekOfYear
{
    NSCalendar *calendar = [NSCalendar ls_sharedCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitWeekOfYear
                                              fromDate:self];
    return component.weekOfYear;
}

- (NSInteger)ls_hour
{
    NSCalendar *calendar = [NSCalendar ls_sharedCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitHour
                                              fromDate:self];
    return component.hour;
}

- (NSInteger)ls_minute
{
    NSCalendar *calendar = [NSCalendar ls_sharedCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitMinute
                                              fromDate:self];
    return component.minute;
}

- (NSInteger)ls_second
{
    NSCalendar *calendar = [NSCalendar ls_sharedCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitSecond
                                              fromDate:self];
    return component.second;
}

- (NSDate *)ls_dateByIgnoringTimeComponents
{
    NSCalendar *calendar = [NSCalendar ls_sharedCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay
                                               fromDate:self];
    return [calendar dateFromComponents:components];
}

- (NSDate *)ls_firstDayOfMonth
{
    NSCalendar *calendar = [NSCalendar ls_sharedCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth| NSCalendarUnitDay
                                               fromDate:self];
    components.day = 1;
    return [calendar dateFromComponents:components];
}

- (NSDate *)ls_lastDayOfMonth
{
    NSCalendar *calendar = [NSCalendar ls_sharedCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay
                                               fromDate:self];
    components.month++;
    components.day = 0;
    return [calendar dateFromComponents:components];
}

- (NSInteger)ls_numberOfDaysInMonth
{
    NSCalendar *c = [NSCalendar ls_sharedCalendar];
    NSRange days = [c rangeOfUnit:NSCalendarUnitDay
                           inUnit:NSCalendarUnitMonth
                          forDate:self];
    return days.length;
}

- (NSString *)ls_stringWithFormat:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

- (NSDate *)ls_dateByAddingYears:(NSInteger)years
{
    NSCalendar *calendar = [NSCalendar ls_sharedCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:years];
    
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)ls_dateBySubtractingYears:(NSInteger)years
{
    return [self ls_dateByAddingYears:-years];
}

- (NSDate *)ls_dateByAddingMonths:(NSInteger)months
{
    NSCalendar *calendar = [NSCalendar ls_sharedCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setMonth:months];
    
    return [calendar dateByAddingComponents:components
                                     toDate:self
                                    options:0];
}

- (NSDate *)ls_dateBySubtractingMonths:(NSInteger)months
{
    return [self ls_dateByAddingMonths:-months];
}

- (NSDate *)ls_dateByAddingWeeks:(NSInteger)weeks
{
    NSCalendar *calendar = [NSCalendar ls_sharedCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setWeekOfYear:weeks];
    
    return [calendar dateByAddingComponents:components
                                     toDate:self
                                    options:0];
}

- (NSDate *)ls_dateBySubtractingWeeks:(NSInteger)weeks
{
    return [self ls_dateByAddingWeeks:-weeks];
}

- (NSDate *)ls_dateByAddingDays:(NSInteger)days
{
    NSCalendar *calendar = [NSCalendar ls_sharedCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:days];
    return [calendar dateByAddingComponents:components
                                     toDate:self
                                    options:0];
}

- (NSDate *)ls_dateBySubtractingDays:(NSInteger)days
{
    return [self ls_dateByAddingDays:-days];
}

- (NSInteger)ls_yearsFrom:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar ls_sharedCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear
                                               fromDate:date
                                                 toDate:self
                                                options:0];
    return components.year;
}

- (NSInteger)ls_monthsFrom:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar ls_sharedCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitMonth
                                               fromDate:date
                                                 toDate:self
                                                options:0];
    return components.month;
}

- (NSInteger)ls_weeksFrom:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar ls_sharedCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekOfYear
                                               fromDate:date
                                                 toDate:self
                                                options:0];
    return components.weekOfYear;
}

- (NSInteger)ls_daysFrom:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar ls_sharedCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitDay
                                               fromDate:date
                                                 toDate:self
                                                options:0];
    return components.day;
}

- (BOOL)ls_isEqualToDateForMonth:(NSDate *)date
{
    return self.ls_year == date.ls_year && self.ls_month == date.ls_month;
}

- (BOOL)ls_isEqualToDateForWeek:(NSDate *)date
{
    return self.ls_year == date.ls_year && self.ls_weekOfYear == date.ls_weekOfYear;
}

- (BOOL)ls_isEqualToDateForDay:(NSDate *)date
{
    return self.ls_year == date.ls_year && self.ls_month == date.ls_month && self.ls_day == date.ls_day;
}

+ (instancetype)ls_dateFromString:(NSString *)string format:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    return [formatter dateFromString:string];
}

+ (instancetype)ls_dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
{
    NSCalendar *calendar = [NSCalendar ls_sharedCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = year;
    components.month = month;
    components.day = day;
    return [calendar dateFromComponents:components];
}

@end


#pragma mark - NSCalendar (LSExtension) -
@implementation NSCalendar (LSExtension)

+ (instancetype)ls_sharedCalendar
{
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [NSCalendar currentCalendar];
    });
    return instance;
}

@end


