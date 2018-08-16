//
//  NSDate+DXHelper.m
//  DXHelper
//
//  Created by doorxp on 2017/6/16.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import "NSDate+DXHelper.h"

@implementation NSDate (DXHelper)
+ (NSCalendar *)shareCalender {
    static NSCalendar *calendar = nil;
    if (!calendar) {
        calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    }
    return calendar;
}

- (NSString *)yearMonth {
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy/MM"];
        formatter.calendar = [NSDate shareCalender];
    }
    
    return [formatter stringFromDate:self];
}

- (NSString *)monthDay {
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MM/dd"];
        formatter.calendar = [NSDate shareCalender];
    }
    
    return [formatter stringFromDate:self];
}

- (NSString *)yearMonthDay {
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy/MM/dd"];
        formatter.calendar = [NSDate shareCalender];;
    }
    
    return [formatter stringFromDate:self];
}

- (NSString *)fullStr {
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy/MM/dd HH:mm"];
        formatter.calendar =[NSDate shareCalender];
    }
    
    return [formatter stringFromDate:self];
}

- (NSString *)smartStr {
    return [self fullStr];
}

- (NSInteger)daysToToday {
    NSDateComponents *comp =
    [[NSDate shareCalender] components:NSCalendarUnitDay
                              fromDate:self
                                toDate:[NSDate date]
                               options:kNilOptions];
    return comp.day;
}

- (NSString *)format:(NSString *)fmt {
    static NSMutableDictionary<NSString *, NSDateFormatter *> *formatterCache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatterCache = [NSMutableDictionary<NSString *, NSDateFormatter *> dictionary];
    });
    
    NSDateFormatter *fmter = nil;
    @synchronized (formatterCache) {
        fmter = [formatterCache objectForKey:fmt];
        
        if(!fmter) {
            fmter = [[NSDateFormatter alloc] init];
            [fmter setDateFormat:fmt];
            fmter.calendar =[NSDate shareCalender];
            
            [formatterCache setObject:fmter forKey:fmt];
        }
    }
    
    return [fmter stringFromDate:self];
}
@end
