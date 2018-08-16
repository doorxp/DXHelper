//
//  NSDictionary+DXHelper.m
//  DXHelper
//
//  Created by doorxp on 2017/6/16.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import "NSDictionary+DXHelper.h"
#import "NSData+DXHelper.h"
#import "NSString+DXHelper.h"


@implementation NSDictionary (DXHelper)
- (NSData *)jsonData
{
    return [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
}

- (NSString *)jsonString
{
    NSData *data = [self jsonData];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSString *)urlParam
{
    __block NSString *strParam = @"";
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id  obj, BOOL * stop)
     {
         if ([obj isKindOfClass:[NSData class]]) {
             obj = [obj encodeBase64];
         }
         else if ([obj isKindOfClass:[NSDate class]]) {
             obj = @([obj timeIntervalSince1970]).stringValue;
         }
         else if ([obj isKindOfClass:[NSNumber class]]) {
             obj = [obj stringValue];
         }
         
         strParam = [strParam stringByAppendingFormat:@"%@=%@&", key, [obj urlEncode]];
     }];
    
    return strParam;
}

- (NSDate *)dateForKey:(NSString *)key {
    NSNumber *value = [self valueForKeyPath:key];
    if (!value || [value isKindOfClass:[NSNull class]] || [value unsignedIntegerValue] == 0) {
        return nil;
    }
    
    return [NSDate dateWithTimeIntervalSince1970:[value unsignedIntegerValue]];
}

- (BOOL)boolForKey:(NSString *)key {
    return [[self valueForKeyPath:key] boolValue];
}

- (int64_t)intForKey:(NSString *)key {
    NSNumber *o = [self valueForKeyPath:key];
    if ([o isKindOfClass:[NSNumber class]]) {
        return [o unsignedLongLongValue];
    }
    else if ([o isKindOfClass:[NSString class]]) {
        return [(NSString *)o unsignedIntegerValue];
    }
    else {
        return 0;
    }
}

- (float)floatForKey:(NSString *)key {
    NSNumber *o = [self valueForKeyPath:key];
    if ([o isKindOfClass:[NSNumber class]]) {
        return [o floatValue];
    }
    else if ([o isKindOfClass:[NSString class]]) {
        return [(NSString *)o floatValue];
    }
    else {
        return 0;
    }
}

- (NSString *)stringForKey:(NSString *)key {
    NSString *ret = [self valueForKeyPath:key];
    if ([ret isKindOfClass:[NSString class]]) {
        return ret;
    }
    else if ([ret isKindOfClass:[NSNumber class]]){
        return [(NSNumber*)ret stringValue];
    }
    else
    {
        return nil;
    }
}
@end
