//
//  NSNotificationCenter+DXHelper.m
//  DXHelper
//
//  Created by doorxp on 2017/6/19.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import "NSNotificationCenter+DXHelper.h"

@implementation NSNotificationCenter (DXHelper)
+ (void)addObserver:(id)observer
           selector:(SEL)aSelector
               name:(NSString *)aName
             object:(id)anObject
{
    [[NSNotificationCenter defaultCenter] addObserver:observer
                                             selector:aSelector
                                                 name:aName
                                               object:anObject];
}

+ (void)postNotification:(NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

+ (void)postNotificationName:(NSString *)aName
                      object:(id)anObject
{
    [[NSNotificationCenter defaultCenter] postNotificationName:aName
                                                        object:anObject];
}

+ (void)postNotificationWhenIdle:(NSString *)aName object:(id)anObject {
    NSNotification *noti = [NSNotification notificationWithName:aName object:anObject];
    [[NSNotificationQueue defaultQueue] enqueueNotification:noti postingStyle:NSPostWhenIdle];
}

+ (void)postNotificationWhenIdle:(NSString *)aName {
    [self postNotificationWhenIdle:aName object:nil];
}

+ (void)postNotificationName:(NSString *)aName
                      object:(id)anObject
                    userInfo:(NSDictionary *)aUserInfo
{
    [[NSNotificationCenter defaultCenter] postNotificationName:aName
                                                        object:anObject
                                                      userInfo:aUserInfo];
}

+ (void)removeObserver:(id)observer
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer];
}

+ (void)removeObserver:(id)observer
                  name:(NSString *)aName
                object:(id)anObject
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer
                                                    name:aName
                                                  object:anObject];
}

+ (id <NSObject>)addObserverForName:(NSString *)name
                             object:(id)obj
                              queue:(NSOperationQueue *)queue
                         usingBlock:(void (^)(NSNotification *note))block
{
    return [[NSNotificationCenter defaultCenter] addObserverForName:name
                                                             object:obj
                                                              queue:queue
                                                         usingBlock:block];
}


+ (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName
{
    [self addObserver:observer selector:aSelector name:aName object:nil];
}

+ (void)addObserver:(id)observer
           selector:(SEL)aSelector
             object:(id)anObject
              names:(NSString *)aName,...
{
    va_list ap;
    va_start(ap, aName);
    
    NSString *name = aName;
    
    while (name)
    {
        [self addObserver:observer
                 selector:aSelector
                     name:name
                   object:anObject];
        
        name = va_arg(ap, NSString *);
    }
    
    va_end(ap);
}

+ (void)addObserver:(id)observer
           selector:(SEL)aSelector
              names:(NSString *)aName,...
{
    va_list ap;
    va_start(ap, aName);
    
    NSString *name = aName;
    
    while (name)
    {
        [self addObserver:observer
                 selector:aSelector
                     name:name
                   object:nil];
        
        name = va_arg(ap, NSString *);
    }
    
    va_end(ap);
}
@end
