//
//  NSUserDefaults+DXHelper.h
//  DXHelper
//
//  Created by doorxp on 2017/6/19.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (DXHelper)
+ (id)objectForKey:(NSString *)key;
+ (void)setObject:(id)obj forKey:(NSString *)key;


+ (NSString *)stringForKey:(NSString *)defaultName;
+ (NSArray *)arrayForKey:(NSString *)defaultName;
+ (NSDictionary *)dictionaryForKey:(NSString *)defaultName;
+ (NSData *)dataForKey:(NSString *)defaultName;
+ (NSArray *)stringArrayForKey:(NSString *)defaultName;
+ (NSInteger)integerForKey:(NSString *)defaultName;
+ (float)floatForKey:(NSString *)defaultName;
+ (double)doubleForKey:(NSString *)defaultName;
+ (BOOL)boolForKey:(NSString *)defaultName;
+ (NSURL *)URLForKey:(NSString *)defaultName;

+ (void)setInteger:(NSInteger)value forKey:(NSString *)defaultName;
+ (void)setFloat:(float)value forKey:(NSString *)defaultName;
+ (void)setDouble:(double)value forKey:(NSString *)defaultName;
+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName;
+ (void)setURL:(NSURL *)url forKey:(NSString *)defaultName;

//+ (void)setDate:(NSDate *)date forKey:(NSString *)defaultName;
//+ (NSDate *)dateForKey:(NSString *)defaultName;

+ (void)save;

+ (void)registerDefaults:(NSDictionary *)dict;
@end
