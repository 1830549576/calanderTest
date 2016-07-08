//
//  NSString+Category.h
//  calanderTest
//
//  Created by alnpet on 16/6/21.
//  Copyright © 2016年 alnpet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Category)


//1. self代表的是调用方法的时间NSDate类型.这是在NSDate的类目中增加的方法
//获取当前的年
-(NSInteger)year;
//获取当前的月
-(NSInteger)month;
//获取当前的日
-(NSInteger)day;
//获取当前月有多少天
- (NSUInteger)numberOfDaysInCurrentMonth;

//获得当前月的第一个星期有几天
-(int)firstWeekDayInMonth;
//减去第一周的天数，剩余天数除以7，得到倍数和余数, 获得一个月有几周
- (NSUInteger)numberOfWeeksInCurrentMonth;

/**
 *确定某天是周几
 */
-(int)baseWeekly;

/**
 *获取本月第一天
 */
- (NSDate *)baseFirstDayOfCurrentMonth;















//
////2.在调用方法的类中写方法
//
////上一个月的日期
//- (NSDate *)lastMonthDate:(NSDate *)date;
////下一个月的日期
//- (NSDate *)nextMonthDate:(NSDate *)date;

@end
