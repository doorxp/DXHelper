//
//  DXHelper.m
//  DXHelper
//
//  Created by doorxp on 2017/6/16.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import "DXHelper.h"

@implementation DXHelper

@end

#ifdef DEBUG
void DEBUGLog(NSString *format, ...) {
    va_list ap;
    va_start(ap, format);
    NSString *str = [[NSString alloc] initWithFormat:format arguments:ap];
    va_end(ap);
    
    str = [str stringByAppendingString:@"\n"];
    
    printf("%s", str.UTF8String);
}
#endif
