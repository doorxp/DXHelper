//
//  NSUserDefaults+DXHelper.m
//  DXHelper
//
//  Created by doorxp on 2017/6/19.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import "NSUserDefaults+DXHelper.h"

@implementation NSUserDefaults (DXHelper)
+ (id)objectForKey:(NSString *)key
{
    return
    [[NSUserDefaults standardUserDefaults] objectForKey:key];
}
+ (void)setObject:(id)obj forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:obj forKey:key];
}

+ (NSString *)stringForKey:(NSString *)defaultName
{
    return [self objectForKey:defaultName];
}
+ (NSArray *)arrayForKey:(NSString *)defaultName
{
    return [self objectForKey:defaultName];
}

+ (NSDictionary *)dictionaryForKey:(NSString *)defaultName
{
    return [self objectForKey:defaultName];
}

+ (NSData *)dataForKey:(NSString *)defaultName
{
    return [self objectForKey:defaultName];
}

+ (NSArray *)stringArrayForKey:(NSString *)defaultName
{
    return [self objectForKey:defaultName];
}

+ (NSInteger)integerForKey:(NSString *)defaultName
{
    return [[self objectForKey:defaultName] integerValue];
}
+ (float)floatForKey:(NSString *)defaultName
{
    return [[self objectForKey:defaultName] floatValue];
}

+ (double)doubleForKey:(NSString *)defaultName
{
    return [[self objectForKey:defaultName] doubleValue];
}

+ (BOOL)boolForKey:(NSString *)defaultName
{
    return [[self objectForKey:defaultName] boolValue];
}

+ (NSURL *)URLForKey:(NSString *)defaultName
{
    return [self objectForKey:defaultName];
}

+ (void)setInteger:(NSInteger)value forKey:(NSString *)defaultName
{
    [self setObject:@(value) forKey:defaultName];
}

+ (void)setFloat:(float)value forKey:(NSString *)defaultName
{
    [self setObject:@(value) forKey:defaultName];
}

+ (void)setDouble:(double)value forKey:(NSString *)defaultName
{
    [self setObject:@(value) forKey:defaultName];
}

+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName
{
    [self setObject:@(value) forKey:defaultName];
}

+ (void)setURL:(NSURL *)url forKey:(NSString *)defaultName
{
    [self setObject:url forKey:defaultName];
}

//+ (void)setDate:(NSDate *)date forKey:(NSString *)defaultName {
//    [self setd]
//}
//
//+ (NSDate *)dateForKey:(NSString *)defaultName {
//
//}

+ (void)save
{
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)registerDefaults:(NSDictionary *)dict
{
    [[NSUserDefaults standardUserDefaults] registerDefaults:dict];
}
@end
