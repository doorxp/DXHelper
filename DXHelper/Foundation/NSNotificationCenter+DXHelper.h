//
//  NSNotificationCenter+DXHelper.h
//  DXHelper
//
//  Created by doorxp on 2017/6/19.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (DXHelper)
+ (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject;

+ (void)postNotification:(NSNotification *)notification;
+ (void)postNotificationName:(NSString *)aName object:(id)anObject;
+ (void)postNotificationName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo;

+ (void)postNotificationWhenIdle:(NSString *)aName object:(id)anObject;
+ (void)postNotificationWhenIdle:(NSString *)aName;

+ (void)removeObserver:(id)observer;
+ (void)removeObserver:(id)observer name:(NSString *)aName object:(id)anObject;

+ (id <NSObject>)addObserverForName:(NSString *)name object:(id)obj queue:(NSOperationQueue *)queue usingBlock:(void (^)(NSNotification *note))block;

+ (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName;


+ (void)addObserver:(id)observer
           selector:(SEL)aSelector
             object:(id)anObject
              names:(NSString *)aName,... NS_REQUIRES_NIL_TERMINATION;

+ (void)addObserver:(id)observer
           selector:(SEL)aSelector
              names:(NSString *)aName,... NS_REQUIRES_NIL_TERMINATION;
@end

@compatibility_alias NSCenter NSNotificationCenter;
