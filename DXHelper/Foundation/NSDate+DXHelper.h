//
//  NSDate+DXHelper.h
//  DXHelper
//
//  Created by doorxp on 2017/6/16.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DXHelper)
- (NSString *)yearMonth;
- (NSString *)monthDay;

- (NSString *)fullStr;
- (NSString *)smartStr;

- (NSString *)yearMonthDay;

- (NSInteger)daysToToday;

- (NSString *)format:(NSString *)fmt;
@end
