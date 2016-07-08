//
//  NSString+Category.m
//  calanderTest
//
//  Created by alnpet on 16/6/21.
//  Copyright © 2016年 alnpet. All rights reserved.
//

#import "NSDate+Category.h"
#import <Foundation/Foundation.h>


@implementation NSDate (Category)


//1. self代表的是调用方法的时间NSDate类型.这是在NSDate的类目中增加的方法
//获取当前的年
-(NSInteger)year {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitYear fromDate:self];
    return [components year];
}

//获取当前的月
-(NSInteger)month {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitMonth fromDate:self];
    return [components month];
}

//获取当前的日
-(NSInteger)day {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitDay fromDate:self];
    return [components day];
}

//获取当前月有多少天
- (NSUInteger)numberOfDaysInCurrentMonth
{
    // 频繁调用 [NSCalendar currentCalendar] 可能存在性能问题
    
   // [NSCalendar currentCalendar] rangeOfUnit:<#(NSCalendarUnit)#> inUnit:<#(NSCalendarUnit)#> forDate:<#(nonnull NSDate *)#>
    
    return [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self].length;
}


//获得当前月的第一个星期有几天
-(int)firstWeekDayInMonth {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [gregorian setFirstWeekday:1];
    //[gregorian setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"nl_NL"]];
    
    //Set date to first of month
    NSDateComponents *comps = [gregorian components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    [comps setDay:1];
    NSDate *newDate = [gregorian dateFromComponents:comps];
    
    return (8 - [gregorian ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:newDate]);
}

//减去第一周的天数，剩余天数除以7，得到倍数和余数, 获得一个月有几周
- (NSUInteger)numberOfWeeksInCurrentMonth
{
    NSUInteger weeks = 0;
    NSUInteger weekday = [self firstWeekDayInMonth];
    if (weekday > 0) {
        weeks += 1;
    }
    NSUInteger monthDays = [self numberOfDaysInCurrentMonth];
    weeks = weeks + (monthDays - weekday)/7;
    if ((monthDays - weekday) %7 > 0) {
        weeks += 1;
    }
    
    return weeks;
}

/**
 *确定某天是周几
 */

-(int)baseWeekly{
    return (int)[[NSCalendar currentCalendar] ordinalityOfUnit:NSDayCalendarUnit inUnit:NSWeekCalendarUnit forDate:self];
}




- (NSDate *)baseFirstDayOfCurrentMonth
{
    NSDate *startDate = nil;
    BOOL ok = [[NSCalendar currentCalendar] rangeOfUnit:NSMonthCalendarUnit startDate:&startDate interval:NULL forDate:self];
    NSAssert1(ok, @"Failed to calculate the first day of the month based on %@", self);
    return startDate;
}



////2.在调用方法的类中写方法
//
////上一个月的日期
//- (NSDate *)lastMonthDate:(NSDate *)date
//{
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    NSDateComponents *components = [calendar components:(NSCalendarUnitWeekday | NSCalendarUnitMonth |NSCalendarUnitYear | NSCalendarUnitDay) fromDate:date];
//    if ([components month] == 1) {
//        [components setMonth:12];
//        [components setYear:[components year] - 1];
//    } else {
//        [components setMonth:[components month] - 1];
//    }
//    NSDate *lastMonth = [calendar dateFromComponents:components];
//    return lastMonth;
//}
//
////下一个月的日期
//- (NSDate *)nextMonthDate:(NSDate *)date
//{
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    NSDateComponents *components = [calendar components:(NSCalendarUnitWeekday|NSCalendarUnitMonth |NSCalendarUnitYear | NSCalendarUnitDay) fromDate:date];
//    if ([components month] == 12) {
//        [components setMonth:1];
//        [components setYear:[components year] + 1];
//    } else {
//        [components setMonth:[components month] + 1];
//        
//    }
//    NSDate *lastMonth = [calendar dateFromComponents:components];
//    return lastMonth;
//}

@end
