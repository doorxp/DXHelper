//
//  NSDictionary+DXHelper.h
//  DXHelper
//
//  Created by doorxp on 2017/6/16.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (DXHelper)
- (NSData *)jsonData;
- (NSString *)jsonString;

- (NSString *)urlParam;

- (NSDate *)dateForKey:(NSString *)key;
- (BOOL)boolForKey:(NSString *)key;
- (int64_t)intForKey:(NSString *)key;
- (float)floatForKey:(NSString *)key;

- (NSString *)stringForKey:(NSString *)key;
@end
